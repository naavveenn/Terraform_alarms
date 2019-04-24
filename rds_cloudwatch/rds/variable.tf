variable "sns_arn" {
        default = "arn:aws:sns:ap-southeast-1:xxxxxxxxxxxx:test"
}


variable "db_identifier" {
       type = "list"
       default = [	"demo-1",
			"test-1"
		]
}

variable "threshold" {
	type = "map"
	default = {
			"CPUUtilization" = "85"
			"DatabaseConnections" = "50"
			"FreeableMemory" = "1000000000"
			"FreeStorageSpace" = "3000000000"
			"WriteIOPS" = "100"
			"ReadIOPS" = "100"
			"ReadThroughput" = "200"
			"WriteThroughput" = "200"
}
}
