{{/* Generate basic labels */}}
{{ define "mtproto-proxy.labels" -}}
helm.sh/chart: {{ include "mtproto-proxy.chart" . }}
{{ include "mtproto-proxy.selectorLabels" . }}
app.kubernetes.io/name: {{ include "mtproto-proxy.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Generate the chart name and version as used by the chart label. */}}
{{ define "mtproto-proxy.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Generate common labels */}}
{{ define "mtproto-proxy.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Generate selector labels */}}
{{ define "mtproto-proxy.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mtproto-proxy.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Generate fullname */}}
{{ define "mtproto-proxy.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }} 