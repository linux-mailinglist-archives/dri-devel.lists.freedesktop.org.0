Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD286C445A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 08:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA9C10E89C;
	Wed, 22 Mar 2023 07:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0472E10E669
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 07:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679471414; x=1711007414;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=c5IWexXFeXkhmnCerJHyrPKe9ek6FXbyZZzv/dM56gM=;
 b=NonO0vIhGbReRniXaMnUp7B/OVM0aNCLhF0bnf1KV7jWYcC1V4OYa/O+
 n94rUEaRBqlzzDazDl3T8tGQUek/2IjecTcntUI1K8trKS7ug1/UzzG30
 TCtFaOoWtVca2xHQCYl82Qgpa/zEukD6QTMej6uN3pIVH/Z639yUisK4s
 ZEyYMpAHdJQq5VHY/wuiTqqojVyCSSD4s302wcl3moCqgF0WqlYB3lPW8
 fHf8v0d4Q0cTpOmeIMKhYrGypvwcpkS18grv21WQfiREQYipv9ZuHTmaI
 WOJokrmf1PfU+V3Vz8xX72hKhBlsFssd4ySg5UvUsryOsytikKWDfy7Hb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="341507468"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="341507468"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 00:49:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="1011262366"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="1011262366"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.146.128])
 ([10.249.146.128])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 00:49:05 -0700
Message-ID: <fd654635-5b77-a6c1-f776-22e33e296300@linux.intel.com>
Date: Wed, 22 Mar 2023 08:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 8/8] MAINTAINERS: Add entry for QAIC driver
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, ogabbay@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, stanislaw.gruszka@linux.intel.com
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-9-git-send-email-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <1679325074-5494-9-git-send-email-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dafna@fastmail.com, linux-doc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 20.03.2023 16:11, Jeffrey Hugo wrote:
> Add MAINTAINERS entry for the Qualcomm Cloud AI 100 driver.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b0db911..12f3028 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17253,6 +17253,16 @@ F:	Documentation/devicetree/bindings/clock/qcom,*
>  F:	drivers/clk/qcom/
>  F:	include/dt-bindings/clock/qcom,*
>  
> +QUALCOMM CLOUD AI (QAIC) DRIVER
> +M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
> +L:	linux-arm-msm@vger.kernel.org
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/accel/qaic/
> +F:	drivers/accel/qaic/
> +F:	include/uapi/drm/qaic_accel.h
> +
>  QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
>  M:	Bjorn Andersson <andersson@kernel.org>
>  M:	Konrad Dybcio <konrad.dybcio@linaro.org>
