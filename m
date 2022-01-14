Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BB848E6BF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 09:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE0510E1E5;
	Fri, 14 Jan 2022 08:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7B010E1D5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 08:43:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20E6gwlx020402;
 Fri, 14 Jan 2022 09:42:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Ak0hNP0jSZB7Ob9FCieszL0HVXIJr7HhykzjKIYBcpA=;
 b=BCYU+ktG/tEgOpDpYpI/Hn1da34OqqUZbCrvQNJCOO5xDCayNGfqCEvHLaOWc5++Av1+
 dLbM0RR9/mOBDkbXboSmZHnyQjliiLWd2zgFZqWGpc71wqeVWpscJI6tYoa9k837uevh
 vCtVDx00Hwf7uGZOb9iywOESYLqafHwU4ofXQiINEaqPbn73856B0p6tCqTXVV1VY6Vr
 t/w39n+QpVRGLEWQHt0Y4tpNG2Kin9yhQ581B1U1p/F06jndTO5nZRDsVMvykmBDFGYf
 xKTaikRYJ42Qvd3cdPUxosl1/pC6hEjYW+kDuLHf1AHm01EvDJ32UrkrMmEmTrY8QvBA jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dk45armgu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 09:42:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1C7E610002A;
 Fri, 14 Jan 2022 09:42:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1011B20ED16;
 Fri, 14 Jan 2022 09:42:47 +0100 (CET)
Received: from lmecxl0993.lme.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 14 Jan
 2022 09:42:45 +0100
Subject: Re: [PATCH 1/2] MAINTAINERS: Update Benjamin Gaignard maintainer
 status
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro
 Carvalho Chehab <mchehab@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Liam Mark
 <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <john.stultz@linaro.org>, Christian
 Konig <christian.koenig@amd.com>, <soc@kernel.org>
References: <20220113171921.17466-1-philippe.cornu@foss.st.com>
 <20220113171921.17466-2-philippe.cornu@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <8c6eb9c2-4e3a-136b-61b4-f3b91b9903aa@foss.st.com>
Date: Fri, 14 Jan 2022 09:42:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113171921.17466-2-philippe.cornu@foss.st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_03,2022-01-13_01,2021-12-02_01
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/13/22 6:19 PM, Philippe Cornu wrote:
> From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> 
> Update Benjamin Gaignard address and remove it from no more maintained
> drivers.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>   MAINTAINERS | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a2345ce8521..6bea080d0159 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5702,7 +5702,7 @@ F:	tools/testing/selftests/dma/
>   
>   DMA-BUF HEAPS FRAMEWORK
>   M:	Sumit Semwal <sumit.semwal@linaro.org>
> -R:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
> +R:	Benjamin Gaignard <benjamin.gaignard@collabora.com>
>   R:	Liam Mark <lmark@codeaurora.org>
>   R:	Laura Abbott <labbott@redhat.com>
>   R:	Brian Starkey <Brian.Starkey@arm.com>
> @@ -6423,7 +6423,6 @@ F:	Documentation/devicetree/bindings/display/rockchip/
>   F:	drivers/gpu/drm/rockchip/
>   
>   DRM DRIVERS FOR STI
> -M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
> @@ -6433,7 +6432,6 @@ F:	drivers/gpu/drm/sti
>   DRM DRIVERS FOR STM
>   M:	Yannick Fertre <yannick.fertre@foss.st.com>
>   M:	Philippe Cornu <philippe.cornu@foss.st.com>
> -M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
> @@ -18154,7 +18152,6 @@ F:	Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
>   F:	sound/soc/sti/
>   
>   STI CEC DRIVER
> -M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/media/stih-cec.txt
>   F:	drivers/media/cec/platform/sti/
> 

Adding my r-b as already done in the original post from Benjamin (see 
https://lore.kernel.org/lkml/20210706163033.795805-1-benjamin.gaignard@collabora.com/)

Reviewed-by: Philippe Cornu <philippe.cornu@foss.st.com>

Thank you
Philippe :-)
