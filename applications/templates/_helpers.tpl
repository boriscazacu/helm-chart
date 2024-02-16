{{/*
Expand the name of the chart.
*/}}
{{- define "ged-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ged-app.fullname" -}}
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

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ged-app.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ged-app.labels" -}}
helm.sh/chart: {{ include "ged-app.chart" . }}
{{ include "ged-app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ged-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ged-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "ged-app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "ged-app.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Get the name of the persistent volume claim
*/}}
{{- define "ged-app.pvcName" -}}
  {{- if .Values.persistence.existingClaim -}}
    {{- printf "%s" (tpl .Values.persistence.existingClaim $) -}}
  {{- else if .Values.persistence.claimName -}}
    {{- printf "%s" (tpl .Values.persistence.claimName $) -}}
  {{- else -}}
		{{- printf "%s" (include "ged-app.fullname" .) -}}
  {{- end -}}
{{- end -}}
{{- define "ged-app.pvcBackupName" -}}
  {{- if .Values.persistence.backup.claimName -}}
    {{- printf "%s" (tpl .Values.persistence.backup.claimName $) -}}
  {{- else -}}
    {{ printf "%s-backup" (include "ged-app.pvcName" .) }}
  {{- end -}}
{{- end -}}
