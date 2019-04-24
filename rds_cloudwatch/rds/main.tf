data "aws_db_instance" "rds" {
        count = "${length(var.db_identifier)}"
        db_instance_identifier = "${var.db_identifier[count.index]}"
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
        count = "${length(var.db_identifier)}"
        alarm_name                = "msp-awsec2-${var.db_identifier[count.index]}-CPUUtilization-Critical"
        comparison_operator       = "GreaterThanOrEqualToThreshold"
        evaluation_periods        = "1"
        metric_name               = "CPUUtilization"
        namespace                 = "AWS/RDS"
        period                    = "300"
        statistic                 = "Average"
        threshold                 = "${var.threshold["CPUUtilization"]}"
        alarm_description         = "This metric monitors RDS cpu utilization"
        alarm_actions             = [ "${var.sns_arn}" ]
        dimensions {
                DBInstanceIdentifier = "${var.db_identifier[count.index]}"
        }
}

resource "aws_cloudwatch_metric_alarm" "freeable_memory" {
        count = "${length(var.db_identifier)}"
        alarm_name                = "msp-awsec2-${var.db_identifier[count.index]}-FreeableMemory-Critical"
        comparison_operator       = "LessThanOrEqualToThreshold"
        evaluation_periods        = "1"
        metric_name               = "FreeableMemory"
        namespace                 = "AWS/RDS"
        period                    = "300"
        statistic                 = "Average"
        threshold                 = "${var.threshold["FreeableMemory"]}"
        alarm_description         = "This metric monitors RDS Freeable memory"
        alarm_actions             = [ "${var.sns_arn}" ]
        dimensions {
                DBInstanceIdentifier = "${var.db_identifier[count.index]}"
        }
}


resource "aws_cloudwatch_metric_alarm" "freeable_storage" {
        count = "${length(var.db_identifier)}"
        alarm_name                = "msp-awsec2-${var.db_identifier[count.index]}-FreeableStorage-Critical"
        comparison_operator       = "LessThanOrEqualToThreshold"
        evaluation_periods        = "1"
        metric_name               = "FreeStorageSpace"
        namespace                 = "AWS/RDS"
        period                    = "300"
        statistic                 = "Average"
        threshold                 = "${var.threshold["FreeStorageSpace"]}"
        alarm_description         = "This metric monitors RDS freeable storage"
        alarm_actions             = [ "${var.sns_arn}" ]
        dimensions {
                DBInstanceIdentifier = "${var.db_identifier[count.index]}"
        }
}


resource "aws_cloudwatch_metric_alarm" "DBConnections" {
        count = "${length(var.db_identifier)}"
        alarm_name                = "msp-awsec2-${var.db_identifier[count.index]}-DBConnection-Critical"
        comparison_operator       = "GreaterThanOrEqualToThreshold"
        evaluation_periods        = "1"
        metric_name               = "DatabaseConnections"
        namespace                 = "AWS/RDS"
        period                    = "300"
        statistic                 = "Average"
        threshold                 = "${var.threshold["DatabaseConnections"]}"
        alarm_description         = "This metric monitors RDS DBConnections"
        alarm_actions             = [ "${var.sns_arn}" ]
        dimensions {
                DBInstanceIdentifier = "${var.db_identifier[count.index]}"
        }
}

resource "aws_cloudwatch_metric_alarm" "ReadIOPS" {
        count = "${length(var.db_identifier)}"
        alarm_name                = "msp-awsec2-${var.db_identifier[count.index]}-ReadIOPS-Critical"
        comparison_operator       = "GreaterThanOrEqualToThreshold"
        evaluation_periods        = "1"
        metric_name               = "ReadIOPS"
        namespace                 = "AWS/RDS"
        period                    = "300"
        statistic                 = "Average"
        threshold                 = "${var.threshold["ReadIOPS"]}"
        alarm_description         = "This metric monitors RDS ReadIOPS"
        alarm_actions             = [ "${var.sns_arn}" ]
        dimensions {
                DBInstanceIdentifier = "${var.db_identifier[count.index]}"
        }
}


resource "aws_cloudwatch_metric_alarm" "WriteIOPS" {
        count = "${length(var.db_identifier)}"
        alarm_name                = "msp-awsec2-${var.db_identifier[count.index]}-WriteIOPS-Critical"
        comparison_operator       = "GreaterThanOrEqualToThreshold"
        evaluation_periods        = "1"
        metric_name               = "WriteIOPS"
        namespace                 = "AWS/RDS"
        period                    = "300"
        statistic                 = "Average"
        threshold                 = "${var.threshold["WriteIOPS"]}"
        alarm_description         = "This metric monitors RDS WriteIOPS"
        alarm_actions             = [ "${var.sns_arn}" ]
        dimensions {
                DBInstanceIdentifier = "${var.db_identifier[count.index]}"
        }
}

resource "aws_cloudwatch_metric_alarm" "ReadThroughput" {
        count = "${length(var.db_identifier)}"
        alarm_name                = "msp-awsec2-${var.db_identifier[count.index]}-ReadThroughput-Critical"
        comparison_operator       = "GreaterThanOrEqualToThreshold"
        evaluation_periods        = "1"
        metric_name               = "ReadThroughput"
        namespace                 = "AWS/RDS"
        period                    = "300"
        statistic                 = "Average"
        threshold                 = "${var.threshold["ReadThroughput"]}"
        alarm_description         = "This metric monitors RDS ReadThroughput"
        alarm_actions             = [ "${var.sns_arn}" ]
        dimensions {
                DBInstanceIdentifier = "${var.db_identifier[count.index]}"
        }
}

resource "aws_cloudwatch_metric_alarm" "WriteThroughput" {
        count = "${length(var.db_identifier)}"
        alarm_name                = "msp-awsec2-${var.db_identifier[count.index]}-WriteThroughput-Critical"
        comparison_operator       = "GreaterThanOrEqualToThreshold"
        evaluation_periods        = "1"
        metric_name               = "WriteThroughput"
        namespace                 = "AWS/RDS"
        period                    = "300"
        statistic                 = "Average"
        threshold                 = "${var.threshold["WriteThroughput"]}"
        alarm_description         = "This metric monitors RDS WriteThroughput"
        alarm_actions             = [ "${var.sns_arn}" ]
        dimensions {
                DBInstanceIdentifier = "${var.db_identifier[count.index]}"
        }
}


output "instance_id" {
        value = "${data.aws_db_instance.rds.*.id}"
}

