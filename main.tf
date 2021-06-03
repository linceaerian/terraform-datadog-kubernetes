terraform {
  required_version = ">= 0.13"
  required_providers {
    datadog = {
      source  = "datadog/datadog"
      version = "= 2.25.0"
    }
  }
}

resource "datadog_monitor" "cluster_capacity_cpu_high" {
  name = "[${var.orchestrator_name}-${var.environment}][CAPACITY] CPU high"
  type = "query alert"

  # We calculate cluster usage to get enough resources to loss one node
  # Number of hosts: avg:kubernetes_state.node.count{${format("%s", (var.scope_cluster_capacity_cpu_high != "" ? var.scope_cluster_capacity_cpu_high: format("lbnid:%s", var.asset_lbnref)))}} by {poolname}
  # avg_cpu * total_nodes / (total_nodes - node_fault_toleration)
  # if env=~prod => node_fault_toleration=1
  query = "avg(${var.timeframe_cluster_capacity_cpu_high}):((100 - avg:system.cpu.idle{${format(
    "%s",
    var.scope_cluster_capacity_cpu_high != "" ? var.scope_cluster_capacity_cpu_high : format("lbnid:%s", var.asset_lbnref),
    )}} by {poolname}) * avg:kubernetes_state.node.count{${format(
    "%s",
    var.scope_cluster_capacity_cpu_high != "" ? var.scope_cluster_capacity_cpu_high : format("lbnid:%s", var.asset_lbnref),
    )}} by {poolname}) / (avg:kubernetes_state.node.count{${format(
    "%s",
    var.scope_cluster_capacity_cpu_high != "" ? var.scope_cluster_capacity_cpu_high : format("lbnid:%s", var.asset_lbnref),
  )}} by {poolname} - ${replace(lower(var.environment), "/prod/", "prod") == "prod" ? 1 : 0} ) > ${var.threshold_critical_cluster_capacity_cpu_high}"

  message = format(
    "%s Notify: %s",
    var.message_cluster_capacity_cpu_high,
    var.notify_cluster_capacity_cpu_high != "" ? var.notify_cluster_capacity_cpu_high : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_cluster_capacity_cpu_high != "" ? var.escalation_message_cluster_capacity_cpu_high : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:cluster_capacity_cpu_high",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_cluster_capacity_cpu_high != "" ? var.isprod_cluster_capacity_cpu_high : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_cluster_capacity_cpu_high}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_cluster_capacity_cpu_high}",
      "irp:${var.irp_cluster_capacity_cpu_high}",
    ],
    var.extra_tags_cluster_capacity_cpu_high,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_cluster_capacity_cpu_high
  notify_no_data    = var.notify_no_data_cluster_capacity_cpu_high
  renotify_interval = format(
    "%s",
    var.renotify_interval_cluster_capacity_cpu_high != -42 ? var.renotify_interval_cluster_capacity_cpu_high : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_cluster_capacity_cpu_high
    warning  = var.threshold_warning_cluster_capacity_cpu_high
  }
}

resource "datadog_monitor" "cluster_capacity_ram_high" {
  name = "[${var.orchestrator_name}-${var.environment}][CAPACITY] RAM usage"
  type = "query alert"

  # We calculate cluster usage to get enough resources to loss one node
  # Number of hosts: avg:kubernetes_state.node.count{${format("%s", (var.scope_cluster_capacity_ram_high != "" ? var.scope_cluster_capacity_ram_high: format("lbnid:%s", var.asset_lbnref)))}} by {poolname}
  # avg_mem_used * total_nodes / (total_nodes - node_fault_toleration)
  # if env=~prod => node_fault_toleration=1
  query = "avg(${var.timeframe_cluster_capacity_ram_high}):((100 - ( avg:system.mem.usable{${format(
    "%s",
    var.scope_cluster_capacity_ram_high != "" ? var.scope_cluster_capacity_ram_high : format("lbnid:%s", var.asset_lbnref),
    )}} by {poolname} * 100 / avg:system.mem.total{${format(
    "%s",
    var.scope_cluster_capacity_ram_high != "" ? var.scope_cluster_capacity_ram_high : format("lbnid:%s", var.asset_lbnref),
    )}} by {poolname} )) * avg:kubernetes_state.node.count{${format(
    "%s",
    var.scope_cluster_capacity_ram_high != "" ? var.scope_cluster_capacity_ram_high : format("lbnid:%s", var.asset_lbnref),
    )}} by {poolname}) / ( avg:kubernetes_state.node.count{${format(
    "%s",
    var.scope_cluster_capacity_ram_high != "" ? var.scope_cluster_capacity_ram_high : format("lbnid:%s", var.asset_lbnref),
  )}} by {poolname} - ${replace(lower(var.environment), "/prod/", "prod") == "prod" ? 1 : 0} ) > ${var.threshold_critical_cluster_capacity_ram_high}"

  message = format(
    "%s Notify: %s",
    var.message_cluster_capacity_ram_high,
    var.notify_cluster_capacity_ram_high != "" ? var.notify_cluster_capacity_ram_high : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_cluster_capacity_ram_high != "" ? var.escalation_message_cluster_capacity_ram_high : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:cluster_capacity_ram_high",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_cluster_capacity_ram_high != "" ? var.isprod_cluster_capacity_ram_high : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_cluster_capacity_ram_high}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_cluster_capacity_ram_high}",
      "irp:${var.irp_cluster_capacity_ram_high}",
    ],
    var.extra_tags_cluster_capacity_ram_high,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_cluster_capacity_ram_high
  notify_no_data    = var.notify_no_data_cluster_capacity_ram_high
  renotify_interval = format(
    "%s",
    var.renotify_interval_cluster_capacity_ram_high != -42 ? var.renotify_interval_cluster_capacity_ram_high : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_cluster_capacity_ram_high
    warning  = var.threshold_warning_cluster_capacity_ram_high
  }
}

resource "datadog_monitor" "cluster_failedscheduling" {
  name = "[${var.orchestrator_name}-${var.environment}][CLUSTER] FailedScheduling"
  type = "event alert"
  query = "events('priority:all FailedScheduling sources:kubernetes tags:${format(
    "%s",
    var.scope_cluster_failedscheduling != "" ? var.scope_cluster_failedscheduling : format("lbnid:%s", var.asset_lbnref),
  )}').rollup('count').last('${var.timeframe_cluster_failedscheduling}') >= ${var.threshold_critical_cluster_failedscheduling}"

  message = format(
    "%s Notify: %s",
    var.message_cluster_failedscheduling,
    var.notify_cluster_failedscheduling != "" ? var.notify_cluster_failedscheduling : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_cluster_failedscheduling != "" ? var.escalation_message_cluster_failedscheduling : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:cluster_failedscheduling",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_cluster_failedscheduling != "" ? var.isprod_cluster_failedscheduling : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_cluster_failedscheduling}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_cluster_failedscheduling}",
      "irp:${var.irp_cluster_failedscheduling}",
    ],
    var.extra_tags_cluster_failedscheduling,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_cluster_failedscheduling
  notify_no_data    = var.notify_no_data_cluster_failedscheduling
  renotify_interval = format(
    "%s",
    var.renotify_interval_cluster_failedscheduling != -42 ? var.renotify_interval_cluster_failedscheduling : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_cluster_failedscheduling
  }
}

resource "datadog_monitor" "cluster_pv_high_usage" {
  name = "[${var.orchestrator_name}-${var.environment}][PersistentVolume] Usage too high"
  type = "metric alert"
  query = "max(${var.timeframe_cluster_pv_high_usage}):0.9313 * ( ( avg:kubernetes.kubelet.volume.stats.capacity_bytes{!custom_cluster_pv_high_usage:true,${format(
    "%s",
    var.scope_cluster_pv_high_usage != "" ? var.scope_cluster_pv_high_usage : format("lbnid:%s", var.asset_lbnref),
    )}} by {persistentvolumeclaim,lbnref,namespace} - avg:kubernetes.kubelet.volume.stats.used_bytes{!custom_cluster_pv_high_usage:true,${format(
    "%s",
    var.scope_cluster_pv_high_usage != "" ? var.scope_cluster_pv_high_usage : format("lbnid:%s", var.asset_lbnref),
    )}} by {persistentvolumeclaim,lbnref} ) - ( avg:kubernetes.kubelet.volume.stats.capacity_bytes{!custom_cluster_pv_high_usage:true,${format(
    "%s",
    var.scope_cluster_pv_high_usage != "" ? var.scope_cluster_pv_high_usage : format("lbnid:%s", var.asset_lbnref),
    )}} by {persistentvolumeclaim,lbnref} / ( 20 * log10( avg:kubernetes.kubelet.volume.stats.capacity_bytes{!custom_cluster_pv_high_usage:true,${format(
    "%s",
    var.scope_cluster_pv_high_usage != "" ? var.scope_cluster_pv_high_usage : format("lbnid:%s", var.asset_lbnref),
  )}} by {persistentvolumeclaim,lbnref,namespace} ) - 9.0309 ) ) ) <= ${var.threshold_critical_cluster_pv_high_usage}"

  message = format(
    "%s Notify: %s",
    var.message_cluster_pv_high_usage,
    var.notify_cluster_pv_high_usage != "" ? var.notify_cluster_pv_high_usage : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_cluster_pv_high_usage != "" ? var.escalation_message_cluster_pv_high_usage : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:cluster_pv_high_usage",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_cluster_pv_high_usage != "" ? var.isprod_cluster_pv_high_usage : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_cluster_pv_high_usage}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_cluster_pv_high_usage}",
      "irp:${var.irp_cluster_pv_high_usage}",
    ],
    var.extra_tags_cluster_pv_high_usage,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_cluster_pv_high_usage
  notify_no_data    = var.notify_no_data_cluster_pv_high_usage
  renotify_interval = format(
    "%s",
    var.renotify_interval_cluster_pv_high_usage != -42 ? var.renotify_interval_cluster_pv_high_usage : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_cluster_pv_high_usage
  }
}

resource "datadog_monitor" "cluster_pvc_pending" {
  name = "[${var.orchestrator_name}-${var.environment}][CLUSTER] Some PersistentVolumeClaims are pending"
  type = "metric alert"
  query = "avg(${var.timeframe_cluster_pvc_pending}):avg:kubernetes_state.persistentvolumes.by_phase{phase:pending,${format(
    "%s",
    var.scope_cluster_pvc_pending != "" ? var.scope_cluster_pvc_pending : format("lbnid:%s", var.asset_lbnref),
  )}} > ${var.threshold_critical_cluster_pvc_pending}"

  message = format(
    "%s Notify: %s",
    var.message_cluster_pvc_pending,
    var.notify_cluster_pvc_pending != "" ? var.notify_cluster_pvc_pending : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_cluster_pvc_pending != "" ? var.escalation_message_cluster_pvc_pending : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:cluster_pvc_pending",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_cluster_pvc_pending != "" ? var.isprod_cluster_pvc_pending : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_cluster_pvc_pending}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_cluster_pvc_pending}",
      "irp:${var.irp_cluster_pvc_pending}",
    ],
    var.extra_tags_cluster_pvc_pending,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_cluster_pvc_pending
  notify_no_data    = var.notify_no_data_cluster_pvc_pending
  renotify_interval = format(
    "%s",
    var.renotify_interval_cluster_pvc_pending != -42 ? var.renotify_interval_cluster_pvc_pending : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_cluster_pvc_pending
  }
}

resource "datadog_monitor" "daemonset_pods_not_enough" {
  name = "[${var.orchestrator_name}-${var.environment}][DAEMONSET] Not enough Pods on DaemonSet"
  type = "query alert"
  query = "avg(${var.timeframe_daemonset_pods_not_enough}):avg:kubernetes_state.daemonset.desired{${format(
    "%s",
    var.scope_daemonset_pods_not_enough != "" ? var.scope_daemonset_pods_not_enough : format("lbnid:%s", var.asset_lbnref),
  )}} by {daemonset,kube_namespace} - avg:kubernetes_state.daemonset.ready{lbnid:${var.asset_lbnref}} by {daemonset,kube_namespace} >= ${var.daemonset_pods_not_enough_threshold_critical}"

  message = format(
    "%s Notify: %s",
    var.message_daemonset_pods_not_enough,
    var.notify_daemonset_pods_not_enough != "" ? var.notify_daemonset_pods_not_enough : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_daemonset_pods_not_enough != "" ? var.escalation_message_daemonset_pods_not_enough : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:daemonset_pods_not_enough",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_daemonset_pods_not_enough != "" ? var.isprod_daemonset_pods_not_enough : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_daemonset_pods_not_enough}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_daemonset_pods_not_enough}",
      "irp:${var.irp_daemonset_pods_not_enough}",
    ],
    var.extra_tags_daemonset_pods_not_enough,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_daemonset_pods_not_enough
  notify_no_data    = var.notify_no_data_daemonset_pods_not_enough
  renotify_interval = format(
    "%s",
    var.renotify_interval_daemonset_pods_not_enough != -42 ? var.renotify_interval_daemonset_pods_not_enough : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    warning  = var.daemonset_pods_not_enough_threshold_warning
    critical = var.daemonset_pods_not_enough_threshold_critical
  }
}

resource "datadog_monitor" "deployment_deleted" {
  name = "[${var.orchestrator_name}-${var.environment}][DEPLOYMENT] Deployment was deleted"
  type = "query alert"
  query = "avg(${var.timeframe_deployment_deleted}):avg:kubernetes_state.deployment.replicas_available{${format(
    "%s",
    var.scope_deployment_deleted != "" ? var.scope_deployment_deleted : format("lbnid:%s", var.asset_lbnref),
  )}} by {kube_namespace,kube_deployment} < ${var.threshold_critical_deployment_deleted}"

  message = format(
    "%s Notify: %s",
    var.message_deployment_deleted,
    var.notify_deployment_deleted != "" ? var.notify_deployment_deleted : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_deployment_deleted != "" ? var.escalation_message_deployment_deleted : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:deployment_deleted",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_deployment_deleted != "" ? var.isprod_deployment_deleted : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_deployment_deleted}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_deployment_deleted}",
      "irp:${var.irp_deployment_deleted}",
    ],
    var.extra_tags_deployment_deleted,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_deployment_deleted
  notify_no_data    = var.notify_no_data_deployment_deleted
  renotify_interval = format(
    "%s",
    var.renotify_interval_deployment_deleted != -42 ? var.renotify_interval_deployment_deleted : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_deployment_deleted
  }
}

resource "datadog_monitor" "deployment_no_pod" {
  name = "[${var.orchestrator_name}-${var.environment}][DEPLOYMENT] No Pod in Deployment"
  type = "query alert"
  query = "avg(${var.timeframe_deployment_no_pod}):avg:kubernetes_state.deployment.replicas_available{${format(
    "%s",
    var.scope_deployment_no_pod != "" ? var.scope_deployment_no_pod : format("lbnid:%s", var.asset_lbnref),
  )}} by {kube_namespace,kube_deployment} < ${var.threshold_critical_deployment_no_pod}"

  message = format(
    "%s Notify: %s",
    var.message_deployment_no_pod,
    var.notify_deployment_no_pod != "" ? var.notify_deployment_no_pod : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_deployment_no_pod != "" ? var.escalation_message_deployment_no_pod : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:deployment_no_pod",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_deployment_no_pod != "" ? var.isprod_deployment_no_pod : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_deployment_no_pod}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_deployment_no_pod}",
      "irp:${var.irp_deployment_no_pod}",
    ],
    var.extra_tags_deployment_no_pod,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_deployment_no_pod
  notify_no_data    = var.notify_no_data_deployment_no_pod
  renotify_interval = format(
    "%s",
    var.renotify_interval_deployment_no_pod != -42 ? var.renotify_interval_deployment_no_pod : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_deployment_no_pod
  }
}

resource "datadog_monitor" "deployment_pods_not_enough" {
  name = "[${var.orchestrator_name}-${var.environment}][DEPLOYMENT] Not enough Pods on Deployment"
  type = "query alert"
  query = "avg(${var.timeframe_deployment_pods_not_enough}):avg:kubernetes_state.deployment.replicas_available{${format(
    "%s",
    var.scope_deployment_pods_not_enough != "" ? var.scope_deployment_pods_not_enough : format("lbnid:%s", var.asset_lbnref),
  )}} by {deployment,kube_namespace} / avg:kubernetes_state.deployment.replicas_desired{lbnid:${var.asset_lbnref}} by {deployment,kube_namespace} < ${var.deployment_pods_not_enough_threshold_critical}"

  message = format(
    "%s Notify: %s",
    var.message_deployment_pods_not_enough,
    var.notify_deployment_pods_not_enough != "" ? var.notify_deployment_pods_not_enough : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_deployment_pods_not_enough != "" ? var.escalation_message_deployment_pods_not_enough : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:deployment_pods_not_enough",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_deployment_pods_not_enough != "" ? var.isprod_deployment_pods_not_enough : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_deployment_pods_not_enough}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_deployment_pods_not_enough}",
      "irp:${var.irp_deployment_pods_not_enough}",
    ],
    var.extra_tags_deployment_pods_not_enough,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_deployment_pods_not_enough
  notify_no_data    = var.notify_no_data_deployment_pods_not_enough
  renotify_interval = format(
    "%s",
    var.renotify_interval_deployment_pods_not_enough != -42 ? var.renotify_interval_deployment_pods_not_enough : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    warning  = var.deployment_pods_not_enough_threshold_warning
    critical = var.deployment_pods_not_enough_threshold_critical
  }
}

resource "datadog_monitor" "host_cpu_high" {
  name = "[${var.orchestrator_name}-${var.environment}][HOST] CPU high"
  type = "metric alert"
  query = "avg(${var.timeframe_host_cpu_high}):100 - avg:system.cpu.idle{${format(
    "%s",
    var.scope_host_cpu_high != "" ? var.scope_host_cpu_high : format("lbnid:%s", var.asset_lbnref),
  )},!custom-agent} by {host} > ${var.threshold_critical_host_cpu_high}"

  message = format(
    "%s Notify: %s",
    var.message_host_cpu_high,
    var.notify_host_cpu_high != "" ? var.notify_host_cpu_high : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_host_cpu_high != "" ? var.escalation_message_host_cpu_high : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:host_cpu_high",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_host_cpu_high != "" ? var.isprod_host_cpu_high : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_host_cpu_high}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_host_cpu_high}",
      "irp:${var.irp_host_cpu_high}",
    ],
    var.extra_tags_host_cpu_high,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_host_cpu_high
  notify_no_data    = var.notify_no_data_host_cpu_high
  renotify_interval = format(
    "%s",
    var.renotify_interval_host_cpu_high != -42 ? var.renotify_interval_host_cpu_high : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_host_cpu_high
    warning  = var.threshold_warning_host_cpu_high
  }
}

resource "datadog_monitor" "host_disk_high" {
  name = "[${var.orchestrator_name}-${var.environment}][HOST] System disk usage high"
  type = "query alert"
  query = "avg(${var.timeframe_host_disk_high}):(avg:system.disk.total{${format(
    "%s",
    var.scope_host_disk_high != "" ? var.scope_host_disk_high : format("lbnid:%s", var.asset_lbnref),
  )},!device:rootfs,!device:shm,!device:tmpfs} by {host,device} - avg:system.disk.free{lbnid:${var.asset_lbnref},!device:rootfs,!device:shm,!device:tmpfs} by {host,device}) * 100 / avg:system.disk.total{lbnid:${var.asset_lbnref},!device:rootfs,!device:shm,!device:tmpfs} by {host,device} > ${var.threshold_critical_host_disk_high}"

  message = format(
    "%s Notify: %s",
    var.message_host_disk_high,
    var.notify_host_disk_high != "" ? var.notify_host_disk_high : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_host_disk_high != "" ? var.escalation_message_host_disk_high : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:host_disk_high",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_host_disk_high != "" ? var.isprod_host_disk_high : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_host_disk_high}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_host_disk_high}",
      "irp:${var.irp_host_disk_high}",
    ],
    var.extra_tags_host_disk_high,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_host_disk_high
  notify_no_data    = var.notify_no_data_host_disk_high
  renotify_interval = format(
    "%s",
    var.renotify_interval_host_disk_high != -42 ? var.renotify_interval_host_disk_high : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_host_disk_high
    warning  = var.threshold_warning_host_disk_high
  }
}

resource "datadog_monitor" "host_load_high" {
  name = "[${var.orchestrator_name}-${var.environment}][HOST] Load average 15m high"
  type = "query alert"
  query = "avg(${var.timeframe_host_load_high}):avg:system.load.5{${format(
    "%s",
    var.scope_host_load_high != "" ? var.scope_host_load_high : format("lbnid:%s", var.asset_lbnref),
  )}} by {host} / avg:kubernetes_state.node.cpu_allocatable{lbnid:${var.asset_lbnref}} by {host} > ${var.threshold_critical_host_load_high}"

  message = format(
    "%s Notify: %s",
    var.message_host_load_high,
    var.notify_host_load_high != "" ? var.notify_host_load_high : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_host_load_high != "" ? var.escalation_message_host_load_high : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:host_load_high",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_host_load_high != "" ? var.isprod_host_load_high : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_host_load_high}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_host_load_high}",
      "irp:${var.irp_host_load_high}",
    ],
    var.extra_tags_host_load_high,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_host_load_high
  notify_no_data    = var.notify_no_data_host_load_high
  renotify_interval = format(
    "%s",
    var.renotify_interval_host_load_high != -42 ? var.renotify_interval_host_load_high : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_host_load_high
    warning  = var.threshold_warning_host_load_high
  }
}

resource "datadog_monitor" "host_node_disk_pressure" {
  name = "[${var.orchestrator_name}-${var.environment}][HOST] Node disk_pressure"
  type = "service check"
  query = "\"kubernetes_state.node.disk_pressure\".over(\"${format(
    "%s",
    var.scope_host_node_disk_pressure != "" ? var.scope_host_node_disk_pressure : format("lbnid:%s", var.asset_lbnref),
  )}\").by(\"host\").last(${var.timeframe_host_node_disk_pressure}).count_by_status()"

  message = format(
    "%s Notify: %s",
    var.message_host_node_disk_pressure,
    var.notify_host_node_disk_pressure != "" ? var.notify_host_node_disk_pressure : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_host_node_disk_pressure != "" ? var.escalation_message_host_node_disk_pressure : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:host_node_disk_pressure",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_host_node_disk_pressure != "" ? var.isprod_host_node_disk_pressure : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_host_node_disk_pressure}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_host_node_disk_pressure}",
      "irp:${var.irp_host_node_disk_pressure}",
    ],
    var.extra_tags_host_node_disk_pressure,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_host_node_disk_pressure
  notify_no_data    = var.notify_no_data_host_node_disk_pressure
  renotify_interval = format(
    "%s",
    var.renotify_interval_host_node_disk_pressure != -42 ? var.renotify_interval_host_node_disk_pressure : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_host_node_disk_pressure
    warning  = var.threshold_warning_host_node_disk_pressure
    ok       = var.threshold_ok_host_node_disk_pressure
  }
}

resource "datadog_monitor" "host_node_memory_pressure" {
  name = "[${var.orchestrator_name}-${var.environment}][HOST] Node memory_pressure"
  type = "service check"
  query = "\"kubernetes_state.node.memory_pressure\".over(\"${format(
    "%s",
    var.scope_host_node_memory_pressure != "" ? var.scope_host_node_memory_pressure : format("lbnid:%s", var.asset_lbnref),
  )}\").by(\"host\").last(${var.timeframe_host_node_memory_pressure}).count_by_status()"

  message = format(
    "%s Notify: %s",
    var.message_host_node_memory_pressure,
    var.notify_host_node_memory_pressure != "" ? var.notify_host_node_memory_pressure : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_host_node_memory_pressure != "" ? var.escalation_message_host_node_memory_pressure : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:host_node_memory_pressure",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_host_node_memory_pressure != "" ? var.isprod_host_node_memory_pressure : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_host_node_memory_pressure}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_host_node_memory_pressure}",
      "irp:${var.irp_host_node_memory_pressure}",
    ],
    var.extra_tags_host_node_memory_pressure,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_host_node_memory_pressure
  notify_no_data    = var.notify_no_data_host_node_memory_pressure
  renotify_interval = format(
    "%s",
    var.renotify_interval_host_node_memory_pressure != -42 ? var.renotify_interval_host_node_memory_pressure : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_host_node_memory_pressure
    warning  = var.threshold_warning_host_node_memory_pressure
    ok       = var.threshold_ok_host_node_memory_pressure
  }
}

resource "datadog_monitor" "host_node_not_ready" {
  name = "[${var.orchestrator_name}-${var.environment}][HOST] Node NotReady"
  type = "service check"
  query = "\"kubernetes_state.node.ready\".over(\"${format(
    "%s",
    var.scope_host_node_not_ready != "" ? var.scope_host_node_not_ready : format("lbnid:%s", var.asset_lbnref),
  )}\").by(\"node\").last(${var.timeframe_host_node_not_ready}).count_by_status()"

  message = format(
    "%s Notify: %s",
    var.message_host_node_not_ready,
    var.notify_host_node_not_ready != "" ? var.notify_host_node_not_ready : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_host_node_not_ready != "" ? var.escalation_message_host_node_not_ready : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:host_node_not_ready",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_host_node_not_ready != "" ? var.isprod_host_node_not_ready : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_host_node_not_ready}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_host_node_not_ready}",
      "irp:${var.irp_host_node_not_ready}",
    ],
    var.extra_tags_host_node_not_ready,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_host_node_not_ready
  notify_no_data    = var.notify_no_data_host_node_not_ready
  renotify_interval = format(
    "%s",
    var.renotify_interval_host_node_not_ready != -42 ? var.renotify_interval_host_node_not_ready : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_host_node_not_ready
    warning  = var.threshold_warning_host_node_not_ready
    ok       = var.threshold_ok_host_node_not_ready
  }
}

resource "datadog_monitor" "host_ntp_sync" {
  name = "[${var.orchestrator_name}-${var.environment}][HOST] NTP not sync"
  type = "service check"
  query = "\"ntp.in_sync\".over(\"${format(
    "%s",
    var.scope_host_ntp_sync != "" ? var.scope_host_ntp_sync : format("lbnid:%s", var.asset_lbnref),
  )}\").exclude('custom-agent').last(${var.timeframe_host_ntp_sync}).count_by_status()"

  message = format(
    "%s Notify: %s",
    var.message_host_ntp_sync,
    var.notify_host_ntp_sync != "" ? var.notify_host_ntp_sync : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_host_ntp_sync != "" ? var.escalation_message_host_ntp_sync : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:host_ntp_sync",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_host_ntp_sync != "" ? var.isprod_host_ntp_sync : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_host_ntp_sync}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_host_ntp_sync}",
      "irp:${var.irp_host_ntp_sync}",
    ],
    var.extra_tags_host_ntp_sync,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_host_ntp_sync
  notify_no_data    = var.notify_no_data_host_ntp_sync
  renotify_interval = format(
    "%s",
    var.renotify_interval_host_ntp_sync != -42 ? var.renotify_interval_host_ntp_sync : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_host_ntp_sync
    warning  = var.threshold_warning_host_ntp_sync
    ok       = var.threshold_ok_host_ntp_sync
  }
}

resource "datadog_monitor" "host_pod_scheduled_not_ready" {
  name = "[${var.orchestrator_name}-${var.environment}][HOST] Some scheduled Pods are not ready"
  type = "query alert"
  query = "avg(${var.timeframe_host_pod_scheduled_not_ready}):avg:kubernetes_state.pod.scheduled{${format(
    "%s",
    var.scope_host_pod_scheduled_not_ready != "" ? var.scope_host_pod_scheduled_not_ready : format("lbnid:%s", var.asset_lbnref),
  )}} by {host} - avg:kubernetes_state.pod.ready{lbnid:${var.asset_lbnref}} by {host} >= ${var.threshold_critical_host_pod_scheduled_not_ready}"

  message = format(
    "%s Notify: %s",
    var.message_host_pod_scheduled_not_ready,
    var.notify_host_pod_scheduled_not_ready != "" ? var.notify_host_pod_scheduled_not_ready : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_host_pod_scheduled_not_ready != "" ? var.escalation_message_host_pod_scheduled_not_ready : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:host_pod_scheduled_not_ready",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_host_pod_scheduled_not_ready != "" ? var.isprod_host_pod_scheduled_not_ready : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_host_pod_scheduled_not_ready}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_host_pod_scheduled_not_ready}",
      "irp:${var.irp_host_pod_scheduled_not_ready}",
    ],
    var.extra_tags_host_pod_scheduled_not_ready,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_host_pod_scheduled_not_ready
  notify_no_data    = var.notify_no_data_host_pod_scheduled_not_ready
  renotify_interval = format(
    "%s",
    var.renotify_interval_host_pod_scheduled_not_ready != -42 ? var.renotify_interval_host_pod_scheduled_not_ready : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_host_pod_scheduled_not_ready
  }
}

resource "datadog_monitor" "host_ram_high" {
  name = "[${var.orchestrator_name}-${var.environment}][HOST] RAM high"
  type = "query alert"
  query = "avg(${var.timeframe_host_ram_high}):avg:system.mem.usable{${format(
    "%s",
    var.scope_host_ram_high != "" ? var.scope_host_ram_high : format("lbnid:%s", var.asset_lbnref),
  )},!custom-agent} by {host} * 100 / avg:system.mem.total{lbnid:${var.asset_lbnref},!custom-agent} by {host} < ${var.threshold_critical_host_ram_high}"

  message = format(
    "%s Notify: %s",
    var.message_host_ram_high,
    var.notify_host_ram_high != "" ? var.notify_host_ram_high : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_host_ram_high != "" ? var.escalation_message_host_ram_high : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:host_ram_high",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_host_ram_high != "" ? var.isprod_host_ram_high : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_host_ram_high}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_host_ram_high}",
      "irp:${var.irp_host_ram_high}",
    ],
    var.extra_tags_host_ram_high,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_host_ram_high
  notify_no_data    = var.notify_no_data_host_ram_high
  renotify_interval = format(
    "%s",
    var.renotify_interval_host_ram_high != -42 ? var.renotify_interval_host_ram_high : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_host_ram_high
    warning  = var.threshold_warning_host_ram_high
  }
}

resource "datadog_monitor" "host_reboot" {
  name = "[${var.orchestrator_name}-${var.environment}][HOST] reboot"
  type = "query alert"
  query = "avg(${var.timeframe_host_reboot}):avg:system.uptime{${format(
    "%s",
    var.scope_host_reboot != "" ? var.scope_host_reboot : format("lbnid:%s", var.asset_lbnref),
  )},!custom-agent} by {host} < ${var.threshold_critical_host_reboot}"

  message = format(
    "%s Notify: %s",
    var.message_host_reboot,
    var.notify_host_reboot != "" ? var.notify_host_reboot : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_host_reboot != "" ? var.escalation_message_host_reboot : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:host_reboot",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_host_reboot != "" ? var.isprod_host_reboot : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_host_reboot}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_host_reboot}",
      "irp:${var.irp_host_reboot}",
    ],
    var.extra_tags_host_reboot,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_host_reboot
  notify_no_data    = var.notify_no_data_host_reboot
  renotify_interval = format(
    "%s",
    var.renotify_interval_host_reboot != -42 ? var.renotify_interval_host_reboot : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_host_reboot
  }
}

resource "datadog_monitor" "services_endpoints_address_not_ready" {
  name = "[${var.orchestrator_name}-${var.environment}][SERVICE ENDPOINTS] Address not ready"
  type = "query alert"
  query = "avg(${var.timeframe_services_endpoints_address_not_ready}):avg:kubernetes_state.endpoint.address_not_ready{${format(
    "%s",
    var.scope_services_endpoints_address_not_ready != "" ? var.scope_services_endpoints_address_not_ready : format("lbnid:%s", var.asset_lbnref),
  )}} by {kube_namespace,endpoint} >= ${var.threshold_critical_services_endpoints_address_not_ready}"

  message = format(
    "%s Notify: %s",
    var.message_services_endpoints_address_not_ready,
    var.notify_services_endpoints_address_not_ready != "" ? var.notify_services_endpoints_address_not_ready : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_services_endpoints_address_not_ready != "" ? var.escalation_message_services_endpoints_address_not_ready : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:services_endpoints_address_not_ready",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_services_endpoints_address_not_ready != "" ? var.isprod_services_endpoints_address_not_ready : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_services_endpoints_address_not_ready}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_services_endpoints_address_not_ready}",
      "irp:${var.irp_services_endpoints_address_not_ready}",
    ],
    var.extra_tags_services_endpoints_address_not_ready,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_services_endpoints_address_not_ready
  notify_no_data    = var.notify_no_data_services_endpoints_address_not_ready
  renotify_interval = format(
    "%s",
    var.renotify_interval_services_endpoints_address_not_ready != -42 ? var.renotify_interval_services_endpoints_address_not_ready : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_services_endpoints_address_not_ready
  }
}

resource "datadog_monitor" "statefulset_no_pod" {
  name = "[${var.orchestrator_name}-${var.environment}][STATEFULSET] No Pod on StatefulSet"
  type = "query alert"
  query = "avg(${var.timeframe_statefulset_no_pod}):avg:kubernetes_state.statefulset.replicas_ready{${format(
    "%s",
    var.scope_statefulset_no_pod != "" ? var.scope_statefulset_no_pod : format("lbnid:%s", var.asset_lbnref),
  )}} by {statefulset,kube_namespace} < ${var.threshold_critical_statefulset_no_pod}"

  message = format(
    "%s Notify: %s",
    var.message_statefulset_no_pod,
    var.notify_statefulset_no_pod != "" ? var.notify_statefulset_no_pod : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_statefulset_no_pod != "" ? var.escalation_message_statefulset_no_pod : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:statefulset_no_pod",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_statefulset_no_pod != "" ? var.isprod_statefulset_no_pod : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_statefulset_no_pod}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_statefulset_no_pod}",
      "irp:${var.irp_statefulset_no_pod}",
    ],
    var.extra_tags_statefulset_no_pod,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_statefulset_no_pod
  notify_no_data    = var.notify_no_data_statefulset_no_pod
  renotify_interval = format(
    "%s",
    var.renotify_interval_statefulset_no_pod != -42 ? var.renotify_interval_statefulset_no_pod : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_statefulset_no_pod
  }
}

resource "datadog_monitor" "statefulset_pods_not_enough" {
  name = "[${var.orchestrator_name}-${var.environment}][STATEFULSET] Not enough Pods on StatefulSet"
  type = "query alert"
  query = "avg(${var.timeframe_statefulset_pods_not_enough}):avg:kubernetes_state.statefulset.replicas_desired{${format(
    "%s",
    var.scope_statefulset_pods_not_enough != "" ? var.scope_statefulset_pods_not_enough : format("lbnid:%s", var.asset_lbnref),
  )}} by {statefulset,kube_namespace} - avg:kubernetes_state.statefulset.replicas_ready{lbnid:${var.asset_lbnref}} by {statefulset,kube_namespace} >= ${var.threshold_critical_statefulset_pods_not_enough}"

  message = format(
    "%s Notify: %s",
    var.message_statefulset_pods_not_enough,
    var.notify_statefulset_pods_not_enough != "" ? var.notify_statefulset_pods_not_enough : var.notify_to,
  )
  escalation_message = format(
    "%s",
    var.escalation_message_statefulset_pods_not_enough != "" ? var.escalation_message_statefulset_pods_not_enough : var.escalation_message,
  )

  tags = concat(
    [
      "monitor_resource_name:statefulset_pods_not_enough",
      "template:${var.template}",
      "lbnref:${var.asset_lbnref}",
      "isprod:${format(
        "%s",
        var.isprod_statefulset_pods_not_enough != "" ? var.isprod_statefulset_pods_not_enough : var.isprod,
      )}",
      "category:${var.category}",
      "customer_name:${var.customer_name}",
      "customer_id:${var.customer_id}",
      "team_in_charge:${var.team_in_charge}",
      "severity:${var.severity_statefulset_pods_not_enough}",
      "type:${var.monitor_type != "" ? var.monitor_type : var.type_statefulset_pods_not_enough}",
      "irp:${var.irp_statefulset_pods_not_enough}",
    ],
    var.extra_tags_statefulset_pods_not_enough,
  )

  evaluation_delay  = var.evaluation_delay
  new_host_delay    = var.new_host_delay
  no_data_timeframe = var.no_data_timeframe_statefulset_pods_not_enough
  notify_no_data    = var.notify_no_data_statefulset_pods_not_enough
  renotify_interval = format(
    "%s",
    var.renotify_interval_statefulset_pods_not_enough != -42 ? var.renotify_interval_statefulset_pods_not_enough : var.renotify_interval,
  )
  require_full_window = true
  include_tags        = false
  notify_audit        = true
  timeout_h           = 0
  silenced            = {}
  locked              = false

  thresholds = {
    critical = var.threshold_critical_statefulset_pods_not_enough
    warning  = var.threshold_warning_statefulset_pods_not_enough
  }
}

