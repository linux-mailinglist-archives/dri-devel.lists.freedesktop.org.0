Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088CC6E76EF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 11:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52BC10E927;
	Wed, 19 Apr 2023 09:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 12296 seconds by postgrey-1.36 at gabe;
 Wed, 19 Apr 2023 09:58:33 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2642810E90D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 09:58:25 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33J3RJOg029283; Wed, 19 Apr 2023 08:33:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=a0RVjPGvpysGmWlyXSCna47YoJUj9XxG6nPGImDZEYA=;
 b=VmAmt6magGC8NPXgyiA5BUEjHaYu3egaY58FimfZUpadFCe9cJGOaVaWeknsSLRgdKNr
 2FjP0/4azw5TZM8uG3S/bI1p5NulakcqIBmuoX+DRsztabZjODf68hspAtL6YEUcU+Qm
 51g8QIAgZHAhjjFcGTUgVFwg7z3oEUmH2bhfQKHoDO0Gs1oiaHSdL0YMzJcxjcnbiVkW
 HfFdbMsotkIFJq64ANCtBWrw1u/JDwTUoWZTy20Xu0Y/Ku8kZnPrTGAvRDjZYF2lOfyN
 GLNzHEafNZM+RsRsVeEw5/10ADT0ugxboH33L1xMKVeHxl/bfPTwsEzAtX5y1qXcCcS3 rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q1qf7f6ax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Apr 2023 08:33:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 52197100034;
 Wed, 19 Apr 2023 08:33:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3629720FA4B;
 Wed, 19 Apr 2023 08:33:21 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 19 Apr
 2023 08:33:20 +0200
Message-ID: <c8c9a22f-3b35-9c4e-21bd-b9695866be32@foss.st.com>
Date: Wed, 19 Apr 2023 08:33:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] MAINTAINERS: Update Alain Volmat's email address for
 drm/sti
Content-Language: en-US
To: Alain Volmat <avolmat@me.com>, <philippe.cornu@foss.st.com>, <arnd@arnd.de>
References: <20230416202747.62479-1-avolmat@me.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230416202747.62479-1-avolmat@me.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_03,2023-04-18_01,2023-02-09_01
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alain

On 4/16/23 22:27, Alain Volmat wrote:
> Update my email address for maintainer of the STi DRM driver.
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0e64787aace8..3cec7ad72389 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6952,7 +6952,7 @@ F:	Documentation/devicetree/bindings/display/rockchip/
>  F:	drivers/gpu/drm/rockchip/
>  
>  DRM DRIVERS FOR STI
> -M:	Alain Volmat <alain.volmat@foss.st.com>
> +M:	Alain Volmat <avolmat@me.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
