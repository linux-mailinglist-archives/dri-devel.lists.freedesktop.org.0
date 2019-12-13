Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FDC11E2A5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 12:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7816E4BA;
	Fri, 13 Dec 2019 11:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226BB6E4BA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 11:18:24 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBDBI4Pa039556;
 Fri, 13 Dec 2019 05:18:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576235884;
 bh=H7BPSf+Mb4Osfrs3oWk3vvPWNcaDr0hYs41wVOdU79s=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Wp+akN+CcgXl8k0vHjR4dwjBGuDVeh4X3WAB5FRsyF5hfMhTYPXdKjHbmY2w7CR1J
 xi2vOPEjg2DE7dk2MQLvcTfiZixyTkLnNsKsbGC6NJM6Kgm998BeeoUYZcXCOYJKF/
 AAfAYPJLnphSdiiCC3fhJsOLqPu8Dac4P3SsteuY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBDBI3MO062693
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Dec 2019 05:18:03 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Dec 2019 05:18:03 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Dec 2019 05:18:03 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBDBI0au096481;
 Fri, 13 Dec 2019 05:18:00 -0600
Subject: Re: [PATCH v3 5/5] MAINTAINERS: add entry for tidss
To: Daniel Vetter <daniel@ffwll.ch>, Jyri Sarha <jsarha@ti.com>
References: <cover.1576158368.git.jsarha@ti.com>
 <09da3a37ca59bb45bef62f2335a191985363d393.1576158368.git.jsarha@ti.com>
 <20191213103024.GH624164@phenom.ffwll.local>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <0acedebf-25d9-6ae2-1307-8f764af449af@ti.com>
Date: Fri, 13 Dec 2019 13:17:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191213103024.GH624164@phenom.ffwll.local>
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 subhajit_paul@ti.com, dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com,
 robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, sjakhade@cadence.com,
 sam@ravnborg.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 13/12/2019 12:30, Daniel Vetter wrote:

>> +DRM DRIVERS FOR TI KEYSTONE
>> +M:	Jyri Sarha <jsarha@ti.com>
>> +M:	Tomi Valkeinen <tomi.valkeinen@ti.com>
>> +L:	dri-devel@lists.freedesktop.org
>> +S:	Maintained
>> +F:	drivers/gpu/drm/tidss/
>> +F:	Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
>> +F:	Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> +F:	Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
>> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> 
> Is the plan to also move other TI drivers over (like tilcdc) or just an
> experiment to see what happens? Asking since if eventually omapdrm moves
> that might be a bit much (or at least needs a discussion first).

Hmm, yes, I think we should have a plan for these.

tilcdc: small, old driver, and I don't see much changes for it. The HW is very different from the 
ones supported by omapdrm and tidss (the two of which have many commonalities). I think drm-misc is 
fine for tilcdc.

omapdrm: big changes going on for now, but after the rewrite to get rid of omapdrm specific drivers 
is done, I expect the patch count to drop, as the HW is "legacy".

tidss: the "new" driver, which should get most attention in the future (after omapdrm rewrite).

All in all, sometimes there have been very few patches for many months, and then sometimes there's a 
big series.

I haven't seen a need to have a maintained branch for omapdrm, as multiple people working on 
conflicting items has been very rare (there aren't that many people working on omapdrm). So I've 
picked patches to my private branch, which I have rebased as needed. And then I've either pushed via 
drm-misc if there's just a few patches, or sent a pull request if there's a lot.

Is such a mixed model ok?

I'm not sure how much is too much for drm-misc, but probably omapdrm and tidss combined (if pushing 
everything always via drm-misc) is a bit too much. So perhaps a maintained TI tree would be an 
option too, and pushing everything for omapdrm and tidss via that tree.

I'm fine with all options, so I think we can go with whatever is most acceptable from DRM maintainer 
point of view.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
