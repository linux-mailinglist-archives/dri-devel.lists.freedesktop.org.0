Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D864D143947
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 10:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FDC6EC0A;
	Tue, 21 Jan 2020 09:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E626EC0A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 09:17:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00L9HLj2055858;
 Tue, 21 Jan 2020 03:17:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1579598242;
 bh=EK8F+wf1AdYZgOLXnJMVZ09hokZ7tbYv9xRU1FSTRzs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=wfr4pHuRJuyTm9b5+vwM+EWT1IWBEA9OMr2YAnCP+HqbV0uXxPAeyNM2Mr/cJXOrG
 OPIoGujcxwGBpqF/i6z8jzBQaNA9pPucovg3C7Ki3qTN2b+55qc1KiKP/y4jMt1LMC
 Rb8q+/jinktCvtifL4MXXcTMGVikA7/OFF3S0PWQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00L9HLr5069436
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 Jan 2020 03:17:21 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Jan 2020 03:17:21 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Jan 2020 03:17:21 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00L9HIs5112911;
 Tue, 21 Jan 2020 03:17:19 -0600
Subject: Re: [PATCH v8 5/5] MAINTAINERS: add entry for tidss
To: Jyri Sarha <jsarha@ti.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>
References: <cover.1579553817.git.jsarha@ti.com>
 <c74bab67540cf4345916999b518018e02085631c.1579553817.git.jsarha@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <2c00ee76-74b9-5bf1-edeb-4f748b09c2e7@ti.com>
Date: Tue, 21 Jan 2020 11:17:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c74bab67540cf4345916999b518018e02085631c.1579553817.git.jsarha@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: yamonkar@cadence.com, praneeth@ti.com, sjakhade@cadence.com,
 peter.ujfalusi@ti.com, laurent.pinchart@ideasonboard.com, subhajit_paul@ti.com,
 sam@ravnborg.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/01/2020 23:02, Jyri Sarha wrote:
> Add entry for tidss DRM driver.
> 
> Version history:
> 
> v2: no change
> 
> v3: - Move tidss entry after omapdrm
>      - Add "T:     git git://anongit.freedesktop.org/drm/drm-misc"
> 
> v4: no change
> 
> v5: no change
> 
> v6: no change
> 
> v7: no change
> 
> v8: - Add Reviewed-by: Benoit Parrot <bparrot@ti.com>
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> Reviewed-by: Benoit Parrot <bparrot@ti.com>
> ---
>   MAINTAINERS | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aa9add598b7d..d8f65dc1dde8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5630,6 +5630,17 @@ S:	Maintained
>   F:	drivers/gpu/drm/omapdrm/
>   F:	Documentation/devicetree/bindings/display/ti/
>   
> +DRM DRIVERS FOR TI KEYSTONE
> +M:	Jyri Sarha <jsarha@ti.com>
> +M:	Tomi Valkeinen <tomi.valkeinen@ti.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +F:	drivers/gpu/drm/tidss/
> +F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> +F:	Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +F:	Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +
>   DRM DRIVERS FOR V3D
>   M:	Eric Anholt <eric@anholt.net>
>   S:	Supported
> 

Acked-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
