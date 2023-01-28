{{/*
PHPMYADMIN HELPERS: 
*/}}

{{- define "phpmyadmin.name" -}}
{{- default .Chart.Name .Values.phpmyadmin.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "phpmyadmin.fullname" -}}
{{- if .Values.phpmyadmin.fullnameOverride -}}
{{- .Values.phpmyadmin.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.phpmyadmin.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "phpmyadmin.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "phpmyadmin.dbfullname" -}}
{{- printf "%s-%s" .Release.Name .Values.phpmyadmin.db.chartName | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "phpmyadmin.image" -}}
{{- $registryName :=  .Values.phpmyadmin.image.registry -}}
{{- $repositoryName := .Values.phpmyadmin.image.repository -}}
{{- $tag := .Values.phpmyadmin.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}



{{/*
MYSQL HELPERS
*/}}


{{- define "mysql.name" -}}
{{- default .Chart.Name .Values.mysql.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "mysql.fullname" -}}
{{- if .Values.mysql.fullnameOverride -}}
{{- .Values.mysql.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.mysql.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "mysql.secretName" -}}
{{ default (include "mysql.fullname" .) .Values.mysql.existingSecret }}
{{- end -}}

{{- define "mysql.image" -}}
{{- $registryName :=  .Values.mysql.image.registry -}}
{{- $repositoryName := .Values.mysql.image.repository -}}
{{- $tag := .Values.mysql.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}


{{- define "mysql.metric.image" -}}
{{- $registryName :=  .Values.mysql.metric.image.registry -}}
{{- $repositoryName := .Values.mysql.metric.image.repository -}}
{{- $tag := .Values.mysql.metric.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}