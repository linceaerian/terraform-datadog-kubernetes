#
# Variables
#
variable "template" {
  description = "Template name"
  default     = "caas-kubernetes"
}

variable "environment" {
  description = "Specifies the environment"
}

variable "default_tags" {
  description = "map of default tags to set on ressources"
  type        = map(string)
  default     = {}
}

variable "custom_tags" {
  description = "map of custom tags to set on ressources"
  type        = map(string)
  default     = {}
}

variable "orchestrator_name" {
  description = "name of the orchestrator solution (monitors prefix): AKS/GKE/EKS…"
}

variable "collect_logs" {
  description = "do we collect logs"
  default     = "false"
}

variable "isprod" {
  description = "activate the monitor on production on Sentinel"
  default     = "false"
}

variable "notify_to" {
  description = "Define notification hooks"
  default     = "@webhook-SGCProd @monitoring-teams"
}

variable "notify_capacity" {
  description = "to who notify capacity alerts"
  default     = ""
}

variable "asset_lbnref" {
  description = "lbnref of master cloud service"
}

variable "asset_name" {
  description = "Asset name"
}

variable "category" {
  description = "Category of the monitors"
  default     = "283"
}

variable "customer_name" {
  description = "Client name as in Idefix"
}

variable "customer_id" {
  description = "ID of the client in Idefix"
}

variable "team_in_charge" {
  description = "Define the team in charge"
  default     = "Undefined"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
}

variable "new_host_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "escalation_message" {
  description = "Default escalation message"
  default     = ""
}

variable "renotify_interval" {
  description = "Delay in minutes before monitor is renotified"
  default     = 40
}

# Datadog Monitor variables

## cluster_capacity_ram_high

variable "message_cluster_capacity_ram_high" {
  description = "Custom message for monitor [cluster_capacity_ram_high]"
  type        = string

  default = <<EOM
    Theses monitor verify the cluster capacity, by node role, for the memory and cpu usage. 
  
EOM

}

variable "escalation_message_cluster_capacity_ram_high" {
  description = "Escalation message for monitor [cluster_capacity_ram_high]"
  type        = string
  default     = ""
}

variable "notify_cluster_capacity_ram_high" {
  description = "Define notification hooks for monitor [notify_cluster_capacity_ram_high]"
  default     = ""
}

variable "isprod_cluster_capacity_ram_high" {
  description = "Define production status for monitor [notify_cluster_capacity_ram_high], usually managed by global isprod variable"
  default     = ""
}

variable "type_cluster_capacity_ram_high" {
  description = "Define type for monitor [notify_cluster_capacity_ram_high]"
  default     = "information"
}

variable "irp_cluster_capacity_ram_high" {
  description = "Define IRP for monitor [notify_cluster_capacity_ram_high]"
  default     = "https://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/orchestrator/IRP/IRP-cluster-capacity"
}

variable "threshold_critical_cluster_capacity_ram_high" {
  description = "Monitor [cluster_capacity_ram_high] critical threshold"
  default     = 90
}

variable "threshold_warning_cluster_capacity_ram_high" {
  description = "Monitor [cluster_capacity_ram_high] warning threshold"
  default     = 80
}

variable "severity_cluster_capacity_ram_high" {
  description = "Define severity for monitor [cluster_capacity_ram_high]"
  default     = "4"
}

variable "timeframe_cluster_capacity_ram_high" {
  description = "Monitor timeframe for monitor [cluster_capacity_ram_high] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_1d"
}

variable "extra_tags_cluster_capacity_ram_high" {
  description = "Extra tags for monitor [cluster_capacity_ram_high]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_cluster_capacity_ram_high" {
  description = "No data timeframe in minutes for monitor [cluster_capacity_ram_high]"
  default     = 2880
}

variable "notify_no_data_cluster_capacity_ram_high" {
  description = "Will raise no data alert if set to true for monitor [cluster_capacity_ram_high]"
  default     = true
}

variable "renotify_interval_cluster_capacity_ram_high" {
  description = "Delay in minutes before monitor [cluster_capacity_ram_high] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_cluster_capacity_ram_high" {
  description = "Define a custom scope for monitor [cluster_capacity_ram_high]"
  default     = ""
}

## cluster_api_operations_error_rate

variable "message_cluster_api_operations_error_rate" {
  description = "Custom message for monitor [cluster_api_operations_error_rate]"
  type        = string

  default = <<EOM
    This monitor calculate the API error rate per operation type.
    In case of anomaly detected based on error rate history, an alert can be raised. 
  
EOM

}

variable "escalation_message_cluster_api_operations_error_rate" {
  description = "Escalation message for monitor [cluster_api_operations_error_rate]"
  type        = string
  default     = ""
}

variable "notify_cluster_api_operations_error_rate" {
  description = "Define notification hooks for monitor [notify_cluster_api_operations_error_rate]"
  default     = ""
}

variable "isprod_cluster_api_operations_error_rate" {
  description = "Define production status for monitor [notify_cluster_api_operations_error_rate], usually managed by global isprod variable"
  default     = ""
}

variable "type_cluster_api_operations_error_rate" {
  description = "Define type for monitor [notify_cluster_api_operations_error_rate]"
  default     = "information"
}

variable "irp_cluster_api_operations_error_rate" {
  description = "Define IRP for monitor [notify_cluster_api_operations_error_rate]"
  default     = "http://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/orchestrator/IRP/IRP-cluster-api-error-rate"
}

variable "threshold_critical_cluster_api_operations_error_rate" {
  description = "Monitor [cluster_api_operations_error_rate] critical threshold"
  default     = 1
}

variable "threshold_critical_recovery_cluster_api_operations_error_rate" {
  description = "Monitor [cluster_api_operations_error_rate] critical_recovery threshold"
  default     = 0
}

variable "severity_cluster_api_operations_error_rate" {
  description = "Define severity for monitor [cluster_api_operations_error_rate]"
  default     = "3"
}

variable "timeframe_cluster_api_operations_error_rate" {
  description = "Monitor timeframe for monitor [cluster_api_operations_error_rate] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_4h"
}

variable "extra_tags_cluster_api_operations_error_rate" {
  description = "Extra tags for monitor [cluster_api_operations_error_rate]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_cluster_api_operations_error_rate" {
  description = "No data timeframe in minutes for monitor [cluster_api_operations_error_rate]"
  default     = 2880
}

variable "notify_no_data_cluster_api_operations_error_rate" {
  description = "Will raise no data alert if set to true for monitor [cluster_api_operations_error_rate]"
  default     = true
}

variable "renotify_interval_cluster_api_operations_error_rate" {
  description = "Delay in minutes before monitor [cluster_api_operations_error_rate] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_cluster_api_operations_error_rate" {
  description = "Define a custom scope for monitor [cluster_api_operations_error_rate]"
  default     = ""
}

## cluster_capacity_cpu_high

variable "message_cluster_capacity_cpu_high" {
  description = "Custom message for monitor [cluster_capacity_cpu_high]"
  type        = string

  default = <<EOM
    Theses monitor verify the cluster capacity, by node role, for the memory and cpu usage. 
  
EOM

}

variable "escalation_message_cluster_capacity_cpu_high" {
  description = "Escalation message for monitor [cluster_capacity_cpu_high]"
  type        = string
  default     = ""
}

variable "notify_cluster_capacity_cpu_high" {
  description = "Define notification hooks for monitor [notify_cluster_capacity_cpu_high]"
  default     = ""
}

variable "isprod_cluster_capacity_cpu_high" {
  description = "Define production status for monitor [notify_cluster_capacity_cpu_high], usually managed by global isprod variable"
  default     = ""
}

variable "type_cluster_capacity_cpu_high" {
  description = "Define type for monitor [notify_cluster_capacity_cpu_high]"
  default     = "incident"
}

variable "irp_cluster_capacity_cpu_high" {
  description = "Define IRP for monitor [notify_cluster_capacity_cpu_high]"
  default     = "https://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/orchestrator/IRP/IRP-cluster-capacity"
}

variable "threshold_critical_cluster_capacity_cpu_high" {
  description = "Monitor [cluster_capacity_cpu_high] critical threshold"
  default     = 90
}

variable "threshold_warning_cluster_capacity_cpu_high" {
  description = "Monitor [cluster_capacity_cpu_high] warning threshold"
  default     = 80
}

variable "severity_cluster_capacity_cpu_high" {
  description = "Define severity for monitor [cluster_capacity_cpu_high]"
  default     = "2"
}

variable "timeframe_cluster_capacity_cpu_high" {
  description = "Monitor timeframe for monitor [cluster_capacity_cpu_high] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_1d"
}

variable "extra_tags_cluster_capacity_cpu_high" {
  description = "Extra tags for monitor [cluster_capacity_cpu_high]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_cluster_capacity_cpu_high" {
  description = "No data timeframe in minutes for monitor [cluster_capacity_cpu_high]"
  default     = 2880
}

variable "notify_no_data_cluster_capacity_cpu_high" {
  description = "Will raise no data alert if set to true for monitor [cluster_capacity_cpu_high]"
  default     = true
}

variable "renotify_interval_cluster_capacity_cpu_high" {
  description = "Delay in minutes before monitor [cluster_capacity_cpu_high] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_cluster_capacity_cpu_high" {
  description = "Define a custom scope for monitor [cluster_capacity_cpu_high]"
  default     = ""
}

## cluster_failedscheduling

variable "message_cluster_failedscheduling" {
  description = "Custom message for monitor [cluster_failedscheduling]"
  type        = string

  default = <<EOM
    This monitor check Kubernetes events and search for FailedScheduling events.
    This event means that the cluster does not find a suitable node to schedule a Pod.
  
EOM

}

variable "escalation_message_cluster_failedscheduling" {
  description = "Escalation message for monitor [cluster_failedscheduling]"
  type        = string
  default     = ""
}

variable "notify_cluster_failedscheduling" {
  description = "Define notification hooks for monitor [notify_cluster_failedscheduling]"
  default     = ""
}

variable "isprod_cluster_failedscheduling" {
  description = "Define production status for monitor [notify_cluster_failedscheduling], usually managed by global isprod variable"
  default     = ""
}

variable "type_cluster_failedscheduling" {
  description = "Define type for monitor [notify_cluster_failedscheduling]"
  default     = "incident"
}

variable "irp_cluster_failedscheduling" {
  description = "Define IRP for monitor [notify_cluster_failedscheduling]"
  default     = "http://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/orchestrator/IRP/IRP-cluster-failedscheduling"
}

variable "threshold_critical_cluster_failedscheduling" {
  description = "Monitor [cluster_failedscheduling] critical threshold"
  default     = 1
}

variable "severity_cluster_failedscheduling" {
  description = "Define severity for monitor [cluster_failedscheduling]"
  default     = "1"
}

variable "timeframe_cluster_failedscheduling" {
  description = "Monitor timeframe for monitor [cluster_failedscheduling] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "5m"
}

variable "extra_tags_cluster_failedscheduling" {
  description = "Extra tags for monitor [cluster_failedscheduling]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_cluster_failedscheduling" {
  description = "No data timeframe in minutes for monitor [cluster_failedscheduling]"
  default     = 2
}

variable "notify_no_data_cluster_failedscheduling" {
  description = "Will raise no data alert if set to true for monitor [cluster_failedscheduling]"
  default     = true
}

variable "renotify_interval_cluster_failedscheduling" {
  description = "Delay in minutes before monitor [cluster_failedscheduling] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_cluster_failedscheduling" {
  description = "Define a custom scope for monitor [cluster_failedscheduling]"
  default     = ""
}

## host_node_not_ready

variable "message_host_node_not_ready" {
  description = "Custom message for monitor [host_node_not_ready]"
  type        = string

  default = <<EOM
    This monitor check that all cluster nodes are Ready.
  
EOM

}

variable "escalation_message_host_node_not_ready" {
  description = "Escalation message for monitor [host_node_not_ready]"
  type        = string
  default     = ""
}

variable "notify_host_node_not_ready" {
  description = "Define notification hooks for monitor [notify_host_node_not_ready]"
  default     = ""
}

variable "isprod_host_node_not_ready" {
  description = "Define production status for monitor [notify_host_node_not_ready], usually managed by global isprod variable"
  default     = ""
}

variable "type_host_node_not_ready" {
  description = "Define type for monitor [notify_host_node_not_ready]"
  default     = "incident"
}

variable "irp_host_node_not_ready" {
  description = "Define IRP for monitor [notify_host_node_not_ready]"
  default     = "http://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/orchestrator/IRP/IRP-cluster-nodes-not-ready"
}

variable "threshold_critical_host_node_not_ready" {
  description = "Monitor [host_node_not_ready] critical threshold"
  default     = 4
}

variable "threshold_warning_host_node_not_ready" {
  description = "Monitor [host_node_not_ready] warning threshold"
  default     = 2
}

variable "threshold_ok_host_node_not_ready" {
  description = "Monitor [host_node_not_ready] ok threshold"
  default     = 2
}

variable "severity_host_node_not_ready" {
  description = "Define severity for monitor [host_node_not_ready]"
  default     = "3"
}

variable "timeframe_host_node_not_ready" {
  description = "Monitor occurence (timeframe) for monitor [host_node_not_ready]"
  type        = string
  default     = "6"
}

variable "extra_tags_host_node_not_ready" {
  description = "Extra tags for monitor [host_node_not_ready]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_host_node_not_ready" {
  description = "No data timeframe in minutes for monitor [host_node_not_ready]"
  default     = 30
}

variable "notify_no_data_host_node_not_ready" {
  description = "Will raise no data alert if set to true for monitor [host_node_not_ready]"
  default     = false
}

variable "renotify_interval_host_node_not_ready" {
  description = "Delay in minutes before monitor [host_node_not_ready] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_host_node_not_ready" {
  description = "Define a custom scope for monitor [host_node_not_ready]"
  default     = ""
}

## cluster_pvc_pending

variable "message_cluster_pvc_pending" {
  description = "Custom message for monitor [cluster_pvc_pending]"
  type        = string

  default = <<EOM
    This monitor check if some PersistentVolumeClaims are not bound to PersistentVolumes on the cluster.
  
EOM

}

variable "escalation_message_cluster_pvc_pending" {
  description = "Escalation message for monitor [cluster_pvc_pending]"
  type        = string
  default     = ""
}

variable "notify_cluster_pvc_pending" {
  description = "Define notification hooks for monitor [notify_cluster_pvc_pending]"
  default     = ""
}

variable "isprod_cluster_pvc_pending" {
  description = "Define production status for monitor [notify_cluster_pvc_pending], usually managed by global isprod variable"
  default     = ""
}

variable "type_cluster_pvc_pending" {
  description = "Define type for monitor [notify_cluster_pvc_pending]"
  default     = "incident"
}

variable "irp_cluster_pvc_pending" {
  description = "Define IRP for monitor [notify_cluster_pvc_pending]"
  default     = "http://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/orchestrator/IRP/IRP-cluster-pvc-pending"
}

variable "threshold_critical_cluster_pvc_pending" {
  description = "Monitor [cluster_pvc_pending] critical threshold"
  default     = 0
}

variable "severity_cluster_pvc_pending" {
  description = "Define severity for monitor [cluster_pvc_pending]"
  default     = "3"
}

variable "timeframe_cluster_pvc_pending" {
  description = "Monitor timeframe for monitor [cluster_pvc_pending] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "extra_tags_cluster_pvc_pending" {
  description = "Extra tags for monitor [cluster_pvc_pending]"
  type        = list(string)
  default     = []
}

variable "scope_cluster_pvc_pending" {
  description = "Define a custom scope for monitor [cluster_pvc_pending]"
  default     = ""
}

variable "no_data_timeframe_cluster_pvc_pending" {
  description = "No data timeframe in minutes for monitor [cluster_pvc_pending]"
  default     = 2
}

variable "notify_no_data_cluster_pvc_pending" {
  description = "Will raise no data alert if set to true for monitor [cluster_pvc_pending]"
  default     = true
}

variable "renotify_interval_cluster_pvc_pending" {
  description = "Delay in minutes before monitor [cluster_pvc_pending] is renotified, default: check renotify_interval"
  default     = -42
}

## daemonset_pods_not_enough

variable "message_daemonset_pods_not_enough" {
  description = "Custom message for monitor [daemonset_pods_not_enough]"
  type        = string

  default = <<EOM
    This monitor check the number of available Pods in a DaemonSet versus the DaemonSet number of ready Pods.
    It is in alert if ready != desired
    The DaemonSet is special kind of Deployment for a Pod that should always run on all cluster Nodes (monitoring agent...)
  
EOM

}

variable "escalation_message_daemonset_pods_not_enough" {
  description = "Escalation message for monitor [daemonset_pods_not_enough]"
  type        = string
  default     = ""
}

variable "notify_daemonset_pods_not_enough" {
  description = "Define notification hooks for monitor [notify_daemonset_pods_not_enough]"
  default     = ""
}

variable "isprod_daemonset_pods_not_enough" {
  description = "Define production status for monitor [notify_daemonset_pods_not_enough], usually managed by global isprod variable"
  default     = ""
}

variable "type_daemonset_pods_not_enough" {
  description = "Define type for monitor [notify_daemonset_pods_not_enough]"
  default     = "incident"
}

variable "irp_daemonset_pods_not_enough" {
  description = "Define IRP for monitor [notify_daemonset_pods_not_enough]"
  default     = "http://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/service/IRP/IRP-daemonset-missing-pods-in-daemonset"
}

variable "severity_daemonset_pods_not_enough" {
  description = "Define severity for monitor [daemonset_pods_not_enough]"
  default     = "2"
}

variable "timeframe_daemonset_pods_not_enough" {
  description = "Monitor timeframe for monitor [daemonset_pods_not_enough] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_10m"
}

variable "extra_tags_daemonset_pods_not_enough" {
  description = "Extra tags for monitor [daemonset_pods_not_enough]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_daemonset_pods_not_enough" {
  description = "No data timeframe in minutes for monitor [daemonset_pods_not_enough]"
  default     = 2
}

variable "notify_no_data_daemonset_pods_not_enough" {
  description = "Will raise no data alert if set to true for monitor [daemonset_pods_not_enough]"
  default     = true
}

variable "renotify_interval_daemonset_pods_not_enough" {
  description = "Delay in minutes before monitor [daemonset_pods_not_enough] is renotified, default: check renotify_interval"
  default     = -42
}

variable "daemonset_pods_not_enough_threshold_warning" {
  description = "Warning threshold for daemonset_pods_not_enough"
  default     = "0.4"
}

variable "daemonset_pods_not_enough_threshold_critical" {
  description = "Critical threshold for daemonset_pods_not_enough"
  default     = "0.9"
}

variable "scope_daemonset_pods_not_enough" {
  description = "Define a custom scope for monitor [daemonset_pods_not_enough]"
  default     = ""
}

## deployment_deleted

variable "message_deployment_deleted" {
  description = "Custom message for monitor [deployment_deleted]"
  type        = string

  default = <<EOM
    This monitor if the Deployment was deleted during last check period.
  
EOM

}

variable "escalation_message_deployment_deleted" {
  description = "Escalation message for monitor [deployment_deleted]"
  type        = string
  default     = ""
}

variable "notify_deployment_deleted" {
  description = "Define notification hooks for monitor [notify_deployment_deleted]"
  default     = ""
}

variable "isprod_deployment_deleted" {
  description = "Define production status for monitor [notify_deployment_deleted], usually managed by global isprod variable"
  default     = ""
}

variable "type_deployment_deleted" {
  description = "Define type for monitor [notify_deployment_deleted]"
  default     = "alert"
}

variable "irp_deployment_deleted" {
  description = "Define IRP for monitor [notify_deployment_deleted]"
  default     = "https://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/service/IRP/IRP-deployments-was-recently-deleted"
}

variable "threshold_critical_deployment_deleted" {
  description = "Monitor [deployment_deleted] critical threshold"
  default     = 1
}

variable "severity_deployment_deleted" {
  description = "Define severity for monitor [deployment_deleted]"
  default     = "3"
}

variable "timeframe_deployment_deleted" {
  description = "Monitor timeframe for monitor [deployment_deleted] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "extra_tags_deployment_deleted" {
  description = "Extra tags for monitor [deployment_deleted]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_deployment_deleted" {
  description = "No data timeframe in minutes for monitor [deployment_deleted]"
  default     = 2
}

variable "notify_no_data_deployment_deleted" {
  description = "Will raise no data alert if set to true for monitor [deployment_deleted]"
  default     = true
}

variable "renotify_interval_deployment_deleted" {
  description = "Delay in minutes before monitor [deployment_deleted] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_deployment_deleted" {
  description = "Define a custom scope for monitor [deployment_deleted]"
  default     = ""
}

## deployment_no_pod

variable "message_deployment_no_pod" {
  description = "Custom message for monitor [deployment_no_pod]"
  type        = string

  default = <<EOM
    This monitor check that there is at least on Pod in each Deployment.
  
EOM

}

variable "escalation_message_deployment_no_pod" {
  description = "Escalation message for monitor [deployment_no_pod]"
  type        = string
  default     = ""
}

variable "notify_deployment_no_pod" {
  description = "Define notification hooks for monitor [notify_deployment_no_pod]"
  default     = ""
}

variable "isprod_deployment_no_pod" {
  description = "Define production status for monitor [notify_deployment_no_pod], usually managed by global isprod variable"
  default     = ""
}

variable "type_deployment_no_pod" {
  description = "Define type for monitor [notify_deployment_no_pod]"
  default     = "incident"
}

variable "irp_deployment_no_pod" {
  description = "Define IRP for monitor [notify_deployment_no_pod]"
  default     = "http://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/service/IRP/IRP-deployments-no-pods-in-deployments"
}

variable "threshold_critical_deployment_no_pod" {
  description = "Monitor [deployment_no_pod] critical threshold"
  default     = 1
}

variable "severity_deployment_no_pod" {
  description = "Define severity for monitor [deployment_no_pod]"
  default     = "2"
}

variable "timeframe_deployment_no_pod" {
  description = "Monitor timeframe for monitor [deployment_no_pod] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "extra_tags_deployment_no_pod" {
  description = "Extra tags for monitor [deployment_no_pod]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_deployment_no_pod" {
  description = "No data timeframe in minutes for monitor [deployment_no_pod]"
  default     = 2
}

variable "notify_no_data_deployment_no_pod" {
  description = "Will raise no data alert if set to true for monitor [deployment_no_pod]"
  default     = false
}

variable "renotify_interval_deployment_no_pod" {
  description = "Delay in minutes before monitor [deployment_no_pod] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_deployment_no_pod" {
  description = "Define a custom scope for monitor [deployment_no_pod]"
  default     = ""
}

## deployment_pods_not_enough

variable "message_deployment_pods_not_enough" {
  description = "Custom message for monitor [deployment_pods_not_enough]"
  type        = string

  default = <<EOM
    This monitor check the number of available Pods in a Deployment versus the Deployment desired number of Pods.
  
EOM

}

variable "escalation_message_deployment_pods_not_enough" {
  description = "Escalation message for monitor [deployment_pods_not_enough]"
  type        = string
  default     = ""
}

variable "notify_deployment_pods_not_enough" {
  description = "Define notification hooks for monitor [notify_deployment_pods_not_enough]"
  default     = ""
}

variable "isprod_deployment_pods_not_enough" {
  description = "Define production status for monitor [notify_deployment_pods_not_enough], usually managed by global isprod variable"
  default     = ""
}

variable "type_deployment_pods_not_enough" {
  description = "Define type for monitor [notify_deployment_pods_not_enough]"
  default     = "incident"
}

variable "irp_deployment_pods_not_enough" {
  description = "Define IRP for monitor [notify_deployment_pods_not_enough]"
  default     = "http://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/service/IRP/IRP-deployments-missing-pods-in-deployments"
}

variable "severity_deployment_pods_not_enough" {
  description = "Define severity for monitor [deployment_pods_not_enough]"
  default     = "2"
}

variable "timeframe_deployment_pods_not_enough" {
  description = "Monitor timeframe for monitor [deployment_pods_not_enough] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_10m"
}

variable "extra_tags_deployment_pods_not_enough" {
  description = "Extra tags for monitor [deployment_pods_not_enough]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_deployment_pods_not_enough" {
  description = "No data timeframe in minutes for monitor [deployment_pods_not_enough]"
  default     = 2
}

variable "notify_no_data_deployment_pods_not_enough" {
  description = "Will raise no data alert if set to true for monitor [deployment_pods_not_enough]"
  default     = false
}

variable "renotify_interval_deployment_pods_not_enough" {
  description = "Delay in minutes before monitor [deployment_pods_not_enough] is renotified, default: check renotify_interval"
  default     = -42
}

variable "deployment_pods_not_enough_threshold_warning" {
  description = "Warning threshold for deployment_pods_not_enough"
  default     = "0.9"
}

variable "deployment_pods_not_enough_threshold_critical" {
  description = "Critical threshold for deployment_pods_not_enough"
  default     = "0.6"
}

variable "scope_deployment_pods_not_enough" {
  description = "Define a custom scope for monitor [deployment_pods_not_enough]"
  default     = ""
}

## host_cpu_high

variable "message_host_cpu_high" {
  description = "Custom message for monitor [host_cpu_high]"
  type        = string

  default = <<EOM
    This monitor check the CPU usage on each Node.
  
EOM

}

variable "escalation_message_host_cpu_high" {
  description = "Escalation message for monitor [host_cpu_high]"
  type        = string
  default     = ""
}

variable "notify_host_cpu_high" {
  description = "Define notification hooks for monitor [notify_host_cpu_high]"
  default     = ""
}

variable "isprod_host_cpu_high" {
  description = "Define production status for monitor [notify_host_cpu_high], usually managed by global isprod variable"
  default     = ""
}

variable "type_host_cpu_high" {
  description = "Define type for monitor [notify_host_cpu_high]"
  default     = "information"
}

variable "irp_host_cpu_high" {
  description = "Define IRP for monitor [notify_host_cpu_high]"
  default     = "http://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/orchestrator/IRP/IRP-host-cpu-high"
}

variable "threshold_critical_host_cpu_high" {
  description = "Monitor [host_cpu_high] critical threshold"
  default     = 85
}

variable "threshold_warning_host_cpu_high" {
  description = "Monitor [host_cpu_high] warning threshold"
  default     = 75
}

variable "severity_host_cpu_high" {
  description = "Define severity for monitor [host_cpu_high]"
  default     = "4"
}

variable "timeframe_host_cpu_high" {
  description = "Monitor timeframe for monitor [host_cpu_high] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_30m"
}

variable "extra_tags_host_cpu_high" {
  description = "Extra tags for monitor [host_cpu_high]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_host_cpu_high" {
  description = "No data timeframe in minutes for monitor [host_cpu_high]"
  default     = 2
}

variable "notify_no_data_host_cpu_high" {
  description = "Will raise no data alert if set to true for monitor [host_cpu_high]"
  default     = false
}

variable "renotify_interval_host_cpu_high" {
  description = "Delay in minutes before monitor [host_cpu_high] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_host_cpu_high" {
  description = "Define a custom scope for monitor [host_cpu_high]"
  default     = ""
}

## host_disk_high

variable "message_host_disk_high" {
  description = "Custom message for monitor [host_disk_high]"
  type        = string

  default = <<EOM
    This monitor check the Disk usage on each Node.
  
EOM

}

variable "escalation_message_host_disk_high" {
  description = "Escalation message for monitor [host_disk_high]"
  type        = string
  default     = ""
}

variable "notify_host_disk_high" {
  description = "Define notification hooks for monitor [notify_host_disk_high]"
  default     = ""
}

variable "isprod_host_disk_high" {
  description = "Define production status for monitor [notify_host_disk_high], usually managed by global isprod variable"
  default     = ""
}

variable "type_host_disk_high" {
  description = "Define type for monitor [notify_host_disk_high]"
  default     = "information"
}

variable "irp_host_disk_high" {
  description = "Define IRP for monitor [notify_host_disk_high]"
  default     = "http://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/orchestrator/IRP/IRP-host-disk-usage-high"
}

# Based on Kubernetes image GC : https://git.lbn.fr/managed_containers/infra-as-code/aks/issues/9
variable "threshold_critical_host_disk_high" {
  description = "Monitor [host_disk_high] critical threshold"
  default     = 95
}

variable "threshold_warning_host_disk_high" {
  description = "Monitor [host_disk_high] warning threshold"
  default     = 90
}

variable "severity_host_disk_high" {
  description = "Define severity for monitor [host_disk_high]"
  default     = "3"
}

variable "timeframe_host_disk_high" {
  description = "Monitor timeframe for monitor [host_disk_high] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "extra_tags_host_disk_high" {
  description = "Extra tags for monitor [host_disk_high]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_host_disk_high" {
  description = "No data timeframe in minutes for monitor [host_disk_high]"
  default     = 2
}

variable "notify_no_data_host_disk_high" {
  description = "Will raise no data alert if set to true for monitor [host_disk_high]"
  default     = false
}

variable "renotify_interval_host_disk_high" {
  description = "Delay in minutes before monitor [host_disk_high] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_host_disk_high" {
  description = "Define a custom scope for monitor [host_disk_high]"
  default     = ""
}

## host_load_high

variable "message_host_load_high" {
  description = "Custom message for monitor [host_load_high]"
  type        = string

  default = <<EOM
    This monitor check the Load usage on each Node.
  
EOM

}

variable "escalation_message_host_load_high" {
  description = "Escalation message for monitor [host_load_high]"
  type        = string
  default     = ""
}

variable "notify_host_load_high" {
  description = "Define notification hooks for monitor [notify_host_load_high]"
  default     = ""
}

variable "isprod_host_load_high" {
  description = "Define production status for monitor [notify_host_load_high], usually managed by global isprod variable"
  default     = ""
}

variable "type_host_load_high" {
  description = "Define type for monitor [notify_host_load_high]"
  default     = "information"
}

variable "irp_host_load_high" {
  description = "Define IRP for monitor [notify_host_load_high]"
  default     = "http://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/orchestrator/IRP/IRP-host-load-high"
}

variable "threshold_critical_host_load_high" {
  description = "Monitor [host_load_high] critical threshold"
  default     = 5
}

variable "threshold_warning_host_load_high" {
  description = "Monitor [host_load_high] warning threshold"
  default     = 3
}

variable "severity_host_load_high" {
  description = "Define severity for monitor [host_load_high]"
  default     = "2"
}

variable "timeframe_host_load_high" {
  description = "Monitor timeframe for monitor [host_load_high] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_30m"
}

variable "extra_tags_host_load_high" {
  description = "Extra tags for monitor [host_load_high]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_host_load_high" {
  description = "No data timeframe in minutes for monitor [host_load_high]"
  default     = 2
}

variable "notify_no_data_host_load_high" {
  description = "Will raise no data alert if set to true for monitor [host_load_high]"
  default     = false
}

variable "renotify_interval_host_load_high" {
  description = "Delay in minutes before monitor [host_load_high] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_host_load_high" {
  description = "Define a custom scope for monitor [host_load_high]"
  default     = ""
}

## host_node_disk_pressure

variable "message_host_node_disk_pressure" {
  description = "Custom message for monitor [host_node_disk_pressure]"
  type        = string

  default = <<EOM
    This monitor detect if the Node is in a disk_pressure condition.
  
EOM

}

variable "escalation_message_host_node_disk_pressure" {
  description = "Escalation message for monitor [host_node_disk_pressure]"
  type        = string
  default     = ""
}

variable "notify_host_node_disk_pressure" {
  description = "Define notification hooks for monitor [notify_host_node_disk_pressure]"
  default     = ""
}

variable "isprod_host_node_disk_pressure" {
  description = "Define production status for monitor [notify_host_node_disk_pressure], usually managed by global isprod variable"
  default     = ""
}

variable "type_host_node_disk_pressure" {
  description = "Define type for monitor [notify_host_node_disk_pressure]"
  default     = "information"
}

variable "irp_host_node_disk_pressure" {
  description = "Define IRP for monitor [notify_host_node_disk_pressure]"
  default     = "http://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/orchestrator/IRP/IRP-host-node-disk-pressure"
}

variable "threshold_critical_host_node_disk_pressure" {
  description = "Monitor [host_node_disk_pressure] critical threshold"
  default     = 1
}

variable "threshold_warning_host_node_disk_pressure" {
  description = "Monitor [host_node_disk_pressure] warning threshold"
  default     = 1
}

variable "threshold_ok_host_node_disk_pressure" {
  description = "Monitor [host_node_disk_pressure] ok threshold"
  default     = 1
}

variable "severity_host_node_disk_pressure" {
  description = "Define severity for monitor [host_node_disk_pressure]"
  default     = "2"
}

variable "timeframe_host_node_disk_pressure" {
  description = "Monitor timeframe for monitor [host_node_disk_pressure]"
  type        = string
  default     = 2
}

variable "extra_tags_host_node_disk_pressure" {
  description = "Extra tags for monitor [host_node_disk_pressure]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_host_node_disk_pressure" {
  description = "No data timeframe in minutes for monitor [host_node_disk_pressure]"
  default     = 2
}

variable "notify_no_data_host_node_disk_pressure" {
  description = "Will raise no data alert if set to true for monitor [host_node_disk_pressure]"
  default     = false
}

variable "renotify_interval_host_node_disk_pressure" {
  description = "Delay in minutes before monitor [host_node_disk_pressure] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_host_node_disk_pressure" {
  description = "Define a custom scope for monitor [host_node_disk_pressure]"
  default     = ""
}

## host_ntp_sync

variable "message_host_ntp_sync" {
  description = "Custom message for monitor [host_ntp_sync]"
  type        = string

  default = <<EOM
    This monitor check if the NTP is correctly synced.
  
EOM

}

variable "escalation_message_host_ntp_sync" {
  description = "Escalation message for monitor [host_ntp_sync]"
  type        = string
  default     = ""
}

variable "notify_host_ntp_sync" {
  description = "Define notification hooks for monitor [notify_host_ntp_sync]"
  default     = ""
}

variable "isprod_host_ntp_sync" {
  description = "Define production status for monitor [notify_host_ntp_sync], usually managed by global isprod variable"
  default     = ""
}

variable "type_host_ntp_sync" {
  description = "Define type for monitor [notify_host_ntp_sync]"
  default     = "information"
}

variable "irp_host_ntp_sync" {
  description = "Define IRP for monitor [notify_host_ntp_sync]"
  default     = "http://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/orchestrator/IRP/IRP-host-ntp-not-sync"
}

variable "threshold_critical_host_ntp_sync" {
  description = "Monitor [host_ntp_sync] critical threshold"
  default     = 1
}

variable "threshold_warning_host_ntp_sync" {
  description = "Monitor [host_ntp_sync] warning threshold"
  default     = 1
}

variable "threshold_ok_host_ntp_sync" {
  description = "Monitor [host_ntp_sync] warning threshold"
  default     = 1
}

variable "severity_host_ntp_sync" {
  description = "Define severity for monitor [host_ntp_sync]"
  default     = "4"
}

variable "timeframe_host_ntp_sync" {
  description = "Monitor timeframe for monitor [host_ntp_sync]"
  type        = string
  default     = 2
}

variable "extra_tags_host_ntp_sync" {
  description = "Extra tags for monitor [host_ntp_sync]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_host_ntp_sync" {
  description = "No data timeframe in minutes for monitor [host_ntp_sync]"
  default     = 2
}

variable "notify_no_data_host_ntp_sync" {
  description = "Will raise no data alert if set to true for monitor [host_ntp_sync]"
  default     = false
}

variable "renotify_interval_host_ntp_sync" {
  description = "Delay in minutes before monitor [host_ntp_sync] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_host_ntp_sync" {
  description = "Define a custom scope for monitor [host_ntp_sync]"
  default     = ""
}

## host_pod_scheduled_not_ready

variable "message_host_pod_scheduled_not_ready" {
  description = "Custom message for monitor [host_pod_scheduled_not_ready]"
  type        = string

  default = <<EOM
    This monitor compare the number on scheduled Pods on host vs the number of Ready Pods on host.
  
EOM

}

variable "escalation_message_host_pod_scheduled_not_ready" {
  description = "Escalation message for monitor [host_pod_scheduled_not_ready]"
  type        = string
  default     = ""
}

variable "notify_host_pod_scheduled_not_ready" {
  description = "Define notification hooks for monitor [notify_host_pod_scheduled_not_ready]"
  default     = ""
}

variable "isprod_host_pod_scheduled_not_ready" {
  description = "Define production status for monitor [notify_host_pod_scheduled_not_ready], usually managed by global isprod variable"
  default     = ""
}

variable "type_host_pod_scheduled_not_ready" {
  description = "Define type for monitor [notify_host_pod_scheduled_not_ready]"
  default     = "information"
}

variable "irp_host_pod_scheduled_not_ready" {
  description = "Define IRP for monitor [notify_host_pod_scheduled_not_ready]"
  default     = "https://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/orchestrator/IRP/IRP-node-notready"
}

variable "threshold_critical_host_pod_scheduled_not_ready" {
  description = "Monitor [host_pod_scheduled_not_ready] critical threshold"
  default     = 1
}

variable "severity_host_pod_scheduled_not_ready" {
  description = "Define severity for monitor [host_pod_scheduled_not_ready]"
  default     = "4"
}

variable "timeframe_host_pod_scheduled_not_ready" {
  description = "Monitor timeframe for monitor [host_pod_scheduled_not_ready] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_10m"
}

variable "extra_tags_host_pod_scheduled_not_ready" {
  description = "Extra tags for monitor [host_pod_scheduled_not_ready]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_host_pod_scheduled_not_ready" {
  description = "No data timeframe in minutes for monitor [host_pod_scheduled_not_ready]"
  default     = 2
}

variable "notify_no_data_host_pod_scheduled_not_ready" {
  description = "Will raise no data alert if set to true for monitor [host_pod_scheduled_not_ready]"
  default     = false
}

variable "renotify_interval_host_pod_scheduled_not_ready" {
  description = "Delay in minutes before monitor [host_pod_scheduled_not_ready] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_host_pod_scheduled_not_ready" {
  description = "Define a custom scope for monitor [host_pod_scheduled_not_ready]"
  default     = ""
}

## host_ram_high

variable "message_host_ram_high" {
  description = "Custom message for monitor [host_ram_high]"
  type        = string

  default = <<EOM
    This monitor check the RAM usage on each Node.
  
EOM

}

variable "escalation_message_host_ram_high" {
  description = "Escalation message for monitor [host_ram_high]"
  type        = string
  default     = ""
}

variable "notify_host_ram_high" {
  description = "Define notification hooks for monitor [notify_host_ram_high]"
  default     = ""
}

variable "isprod_host_ram_high" {
  description = "Define production status for monitor [notify_host_ram_high], usually managed by global isprod variable"
  default     = ""
}

variable "type_host_ram_high" {
  description = "Define type for monitor [notify_host_ram_high]"
  default     = "information"
}

variable "irp_host_ram_high" {
  description = "Define IRP for monitor [notify_host_ram_high]"
  default     = "http://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/orchestrator/IRP/IRP-host-ram-high"
}

variable "threshold_critical_host_ram_high" {
  description = "Monitor [host_ram_high] critical threshold"
  default     = 10
}

variable "threshold_warning_host_ram_high" {
  description = "Monitor [host_ram_high] warning threshold"
  default     = 20
}

variable "severity_host_ram_high" {
  description = "Define severity for monitor [host_ram_high]"
  default     = "3"
}

variable "timeframe_host_ram_high" {
  description = "Monitor timeframe for monitor [host_ram_high] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "extra_tags_host_ram_high" {
  description = "Extra tags for monitor [host_ram_high]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_host_ram_high" {
  description = "No data timeframe in minutes for monitor [host_ram_high]"
  default     = 2
}

variable "notify_no_data_host_ram_high" {
  description = "Will raise no data alert if set to true for monitor [host_ram_high]"
  default     = false
}

variable "renotify_interval_host_ram_high" {
  description = "Delay in minutes before monitor [host_ram_high] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_host_ram_high" {
  description = "Define a custom scope for monitor [host_ram_high]"
  default     = ""
}

## host_reboot

variable "message_host_reboot" {
  description = "Custom message for monitor [host_reboot]"
  type        = string

  default = <<EOM
    This incidate that the server has been restarted recently.
  
EOM

}

variable "escalation_message_host_reboot" {
  description = "Escalation message for monitor [host_reboot]"
  type        = string
  default     = ""
}

variable "notify_host_reboot" {
  description = "Define notification hooks for monitor [notify_host_reboot]"
  default     = ""
}

variable "isprod_host_reboot" {
  description = "Define production status for monitor [notify_host_reboot], usually managed by global isprod variable"
  default     = ""
}

variable "type_host_reboot" {
  description = "Define type for monitor [notify_host_reboot]"
  default     = "information"
}

variable "irp_host_reboot" {
  description = "Define IRP for monitor [notify_host_reboot]"
  default     = "http://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/orchestrator/IRP/IRP-host-reboot"
}

variable "threshold_critical_host_reboot" {
  description = "Monitor [host_reboot] critical threshold"
  default     = 5
}

variable "severity_host_reboot" {
  description = "Define severity for monitor [host_reboot]"
  default     = "3"
}

variable "timeframe_host_reboot" {
  description = "Monitor timeframe for monitor [host_reboot] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "extra_tags_host_reboot" {
  description = "Extra tags for monitor [host_reboot]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_host_reboot" {
  description = "No data timeframe in minutes for monitor [host_reboot]"
  default     = 2
}

variable "notify_no_data_host_reboot" {
  description = "Will raise no data alert if set to true for monitor [host_reboot]"
  default     = false
}

variable "renotify_interval_host_reboot" {
  description = "Delay in minutes before monitor [host_reboot] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_host_reboot" {
  description = "Define a custom scope for monitor [host_reboot]"
  default     = ""
}

## services_endpoints_address_not_ready

variable "message_services_endpoints_address_not_ready" {
  description = "Custom message for monitor [services_endpoints_address_not_ready]"
  type        = string

  default = <<EOM
    This monitor check the endpoints status for each endpoints of each service.
  
EOM

}

variable "escalation_message_services_endpoints_address_not_ready" {
  description = "Escalation message for monitor [services_endpoints_address_not_ready]"
  type        = string
  default     = ""
}

variable "notify_services_endpoints_address_not_ready" {
  description = "Define notification hooks for monitor [notify_services_endpoints_address_not_ready]"
  default     = ""
}

variable "isprod_services_endpoints_address_not_ready" {
  description = "Define production status for monitor [notify_services_endpoints_address_not_ready], usually managed by global isprod variable"
  default     = ""
}

variable "type_services_endpoints_address_not_ready" {
  description = "Define type for monitor [notify_services_endpoints_address_not_ready]"
  default     = "incident"
}

variable "irp_services_endpoints_address_not_ready" {
  description = "Define IRP for monitor [notify_services_endpoints_address_not_ready]"
  default     = "https://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/service/IRP/IRP-service-endpoints-address-not-ready"
}

variable "threshold_critical_services_endpoints_address_not_ready" {
  description = "Monitor [services_endpoints_address_not_ready] critical threshold"
  default     = 1
}

variable "severity_services_endpoints_address_not_ready" {
  description = "Define severity for monitor [services_endpoints_address_not_ready]"
  default     = "2"
}

variable "timeframe_services_endpoints_address_not_ready" {
  description = "Monitor timeframe for monitor [services_endpoints_address_not_ready] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "extra_tags_services_endpoints_address_not_ready" {
  description = "Extra tags for monitor [services_endpoints_address_not_ready]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_services_endpoints_address_not_ready" {
  description = "No data timeframe in minutes for monitor [services_endpoints_address_not_ready]"
  default     = 2
}

variable "notify_no_data_services_endpoints_address_not_ready" {
  description = "Will raise no data alert if set to true for monitor [services_endpoints_address_not_ready]"
  default     = false
}

variable "renotify_interval_services_endpoints_address_not_ready" {
  description = "Delay in minutes before monitor [services_endpoints_address_not_ready] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_services_endpoints_address_not_ready" {
  description = "Define a custom scope for monitor [services_endpoints_address_not_ready]"
  default     = ""
}

## statefulset_no_pod

variable "message_statefulset_no_pod" {
  description = "Custom message for monitor [statefulset_no_pod]"
  type        = string

  default = <<EOM
    This monitor check that there is at least on Pod in each Statefulset.
  
EOM

}

variable "escalation_message_statefulset_no_pod" {
  description = "Escalation message for monitor [statefulset_no_pod]"
  type        = string
  default     = ""
}

variable "notify_statefulset_no_pod" {
  description = "Define notification hooks for monitor [notify_statefulset_no_pod]"
  default     = ""
}

variable "isprod_statefulset_no_pod" {
  description = "Define production status for monitor [notify_statefulset_no_pod], usually managed by global isprod variable"
  default     = ""
}

variable "type_statefulset_no_pod" {
  description = "Define type for monitor [notify_statefulset_no_pod]"
  default     = "incident"
}

variable "irp_statefulset_no_pod" {
  description = "Define IRP for monitor [notify_statefulset_no_pod]"
  default     = "http://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/service/IRP/IRP-statefulset-no-pod"
}

variable "threshold_critical_statefulset_no_pod" {
  description = "Monitor [statefulset_no_pod] critical threshold"
  default     = 1
}

variable "severity_statefulset_no_pod" {
  description = "Define severity for monitor [statefulset_no_pod]"
  default     = "2"
}

variable "timeframe_statefulset_no_pod" {
  description = "Monitor timeframe for monitor [statefulset_no_pod] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "extra_tags_statefulset_no_pod" {
  description = "Extra tags for monitor [statefulset_no_pod]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_statefulset_no_pod" {
  description = "No data timeframe in minutes for monitor [statefulset_no_pod]"
  default     = 2
}

variable "notify_no_data_statefulset_no_pod" {
  description = "Will raise no data alert if set to true for monitor [statefulset_no_pod]"
  default     = true
}

variable "renotify_interval_statefulset_no_pod" {
  description = "Delay in minutes before monitor [statefulset_no_pod] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_statefulset_no_pod" {
  description = "Define a custom scope for monitor [statefulset_no_pod]"
  default     = ""
}

## statefulset_pods_not_enough

variable "message_statefulset_pods_not_enough" {
  description = "Custom message for monitor [statefulset_pods_not_enough]"
  type        = string

  default = <<EOM
    This monitor indicate that there is not enough pods available in the statefulset.
  
EOM

}

variable "escalation_message_statefulset_pods_not_enough" {
  description = "Escalation message for monitor [statefulset_pods_not_enough]"
  type        = string
  default     = ""
}

variable "notify_statefulset_pods_not_enough" {
  description = "Define notification hooks for monitor [notify_statefulset_pods_not_enough]"
  default     = ""
}

variable "isprod_statefulset_pods_not_enough" {
  description = "Define production status for monitor [notify_statefulset_pods_not_enough], usually managed by global isprod variable"
  default     = ""
}

variable "type_statefulset_pods_not_enough" {
  description = "Define type for monitor [notify_statefulset_pods_not_enough]"
  default     = "incident"
}

variable "irp_statefulset_pods_not_enough" {
  description = "Define IRP for monitor [notify_statefulset_pods_not_enough]"
  default     = "https://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/service/IRP/IRP-statefulset-missing-pods"
}

variable "threshold_critical_statefulset_pods_not_enough" {
  description = "Monitor [statefulset_pods_not_enough] critical threshold"
  default     = 0.3
}

variable "threshold_warning_statefulset_pods_not_enough" {
  description = "Monitor [statefulset_pods_not_enough] warning threshold"
  default     = 0.1
}

variable "severity_statefulset_pods_not_enough" {
  description = "Define severity for monitor [statefulset_pods_not_enough]"
  default     = "2"
}

variable "timeframe_statefulset_pods_not_enough" {
  description = "Monitor timeframe for monitor [statefulset_pods_not_enough] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "extra_tags_statefulset_pods_not_enough" {
  description = "Extra tags for monitor [statefulset_pods_not_enough]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_statefulset_pods_not_enough" {
  description = "No data timeframe in minutes for monitor [statefulset_pods_not_enough]"
  default     = 2
}

variable "notify_no_data_statefulset_pods_not_enough" {
  description = "Will raise no data alert if set to true for monitor [statefulset_pods_not_enough]"
  default     = true
}

variable "renotify_interval_statefulset_pods_not_enough" {
  description = "Delay in minutes before monitor [statefulset_pods_not_enough] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_statefulset_pods_not_enough" {
  description = "Define a custom scope for monitor [statefulset_pods_not_enough]"
  default     = ""
}

## host_node_memory_pressure

variable "message_host_node_memory_pressure" {
  description = "Custom message for monitor [host_node_memory_pressure]"
  type        = string

  default = <<EOM
    This monitor detect if the Node is in a memory_pressure condition.
  
EOM

}

variable "escalation_message_host_node_memory_pressure" {
  description = "Escalation message for monitor [host_node_memory_pressure]"
  type        = string
  default     = ""
}

variable "notify_host_node_memory_pressure" {
  description = "Define notification hooks for monitor [notify_host_node_memory_pressure]"
  default     = ""
}

variable "isprod_host_node_memory_pressure" {
  description = "Define production status for monitor [notify_host_node_memory_pressure], usually managed by global isprod variable"
  default     = ""
}

variable "type_host_node_memory_pressure" {
  description = "Define type for monitor [notify_host_node_memory_pressure]"
  default     = "information"
}

variable "irp_host_node_memory_pressure" {
  description = "Define IRP for monitor [notify_host_node_memory_pressure]"
  default     = "http://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/orchestrator/IRP/IRP-host-node-memory-pressure"
}

variable "threshold_critical_host_node_memory_pressure" {
  description = "Monitor [host_node_memory_pressure] critical threshold"
  default     = 1
}

variable "threshold_warning_host_node_memory_pressure" {
  description = "Monitor [host_node_memory_pressure] warning threshold"
  default     = 1
}

variable "threshold_ok_host_node_memory_pressure" {
  description = "Monitor [host_node_memory_pressure] ok threshold"
  default     = 1
}

variable "severity_host_node_memory_pressure" {
  description = "Define severity for monitor [host_node_memory_pressure]"
  default     = "2"
}

variable "timeframe_host_node_memory_pressure" {
  description = "Monitor timeframe for monitor [host_node_memory_pressure] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = 2
}

variable "extra_tags_host_node_memory_pressure" {
  description = "Extra tags for monitor [host_node_memory_pressure]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_host_node_memory_pressure" {
  description = "No data timeframe in minutes for monitor [host_node_memory_pressure]"
  default     = 2
}

variable "notify_no_data_host_node_memory_pressure" {
  description = "Will raise no data alert if set to true for monitor [host_node_memory_pressure]"
  default     = false
}

variable "renotify_interval_host_node_memory_pressure" {
  description = "Delay in minutes before monitor [host_node_memory_pressure] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_host_node_memory_pressure" {
  description = "Define a custom scope for monitor [host_node_memory_pressure]"
  default     = ""
}

## cluster_pv_high_usage

variable "message_cluster_pv_high_usage" {
  description = "Custom message for monitor [cluster_pv_high_usage]"
  type        = string

  default = <<EOM
    This monitor detect if the cluster Persitent volume usage is too high
    and will need a modification to be apply.

    Disk-free threshold formula: (total_size/(log(total_size)*20). Monitor formula: disk_free - disk_free_threshold

    The value should be higher than 0.

    {{#is_alert}} The disk saturation on the persistent volume {{persistentvolumeclaim.name}} has always been critical during the last check period.

    It seems that there is currently a space problem on {{persistentvolumeclaim.name}}

    Cleaning up the disk storage at least {{eval "humanize_bytes(abs(value))"}} in order to have the monitor UP. {{/is_alert}}

    {{#is_alert_recovery}} The disk space usage on the persistent volume {{persistentvolumeclaim.name}} is back to normal now. {{/is_alert_recovery}}

    Please escalate the issue to the team in charge.

    You will probably need to increase the PV by following:
    https://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/orchestrator-components/persistent-storage/?id=resizing-persisentvolumes
  
EOM

}

variable "escalation_message_cluster_pv_high_usage" {
  description = "Escalation message for monitor [cluster_pv_high_usage]"
  type        = string
  default     = ""
}

variable "notify_cluster_pv_high_usage" {
  description = "Define notification hooks for monitor [notify_cluster_pv_high_usage]"
  default     = ""
}

variable "isprod_cluster_pv_high_usage" {
  description = "Define production status for monitor [notify_cluster_pv_high_usage], usually managed by global isprod variable"
  default     = "false"
}

variable "type_cluster_pv_high_usage" {
  description = "Define type for monitor [notify_cluster_pv_high_usage]"
  default     = "incident"
}

variable "irp_cluster_pv_high_usage" {
  description = "Define IRP for monitor [notify_cluster_pv_high_usage]"
  default     = "https://docs.managed-containers.lbn.fr/#/administration-guides/kubernetes/service/IRP/IRP-persistent-volumes-usage-too-high"
}

variable "threshold_critical_cluster_pv_high_usage" {
  description = "Monitor [cluster_pv_high_usage] critical threshold"
  default     = 0
}

variable "severity_cluster_pv_high_usage" {
  description = "Define severity for monitor [cluster_pv_high_usage]"
  default     = "3"
}

variable "timeframe_cluster_pv_high_usage" {
  description = "Monitor timeframe for monitor [cluster_pv_high_usage] [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "extra_tags_cluster_pv_high_usage" {
  description = "Extra tags for monitor [cluster_pv_high_usage]"
  type        = list(string)
  default     = []
}

variable "no_data_timeframe_cluster_pv_high_usage" {
  description = "No data timeframe in minutes for monitor [cluster_pv_high_usage]"
  default     = 600
}

variable "notify_no_data_cluster_pv_high_usage" {
  description = "Will raise no data alert if set to true for monitor [cluster_pv_high_usage]"
  default     = true
}

variable "renotify_interval_cluster_pv_high_usage" {
  description = "Delay in minutes before monitor [cluster_pv_high_usage] is renotified, default: check renotify_interval"
  default     = -42
}

variable "scope_cluster_pv_high_usage" {
  description = "Scope for monitor [cluster_pv_high_usage]"
  type        = string
  default     = ""
}

