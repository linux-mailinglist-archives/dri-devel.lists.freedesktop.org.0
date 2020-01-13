Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B65139D1D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 00:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8864B6E185;
	Mon, 13 Jan 2020 23:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4109 seconds by postgrey-1.36 at gabe;
 Mon, 13 Jan 2020 23:11:42 UTC
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3B56E185
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 23:11:42 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DM359O037548;
 Mon, 13 Jan 2020 16:03:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1578952985;
 bh=Rug31THYwQPzP8BGKmAJvjnJL0H8q1fUltZDH8C1XQY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=MNGKiCq0/28AymdWvy+mdIznd2JMQoTm5hbutpzvfWH9eeOnlUq31M1Z25fakKZrH
 Ycs4Sz3tkVsjJk47pM+IIoLvucZPg11R129autkxsPu1nEN61ITS+Dh0IF9oVGmlUp
 k56YzmCUfroMCBwMjV1YkM9WUHlumMWwRjzuR80M=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DM35RR057932
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 13 Jan 2020 16:03:05 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 16:03:04 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 16:03:05 -0600
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id 00DM34np014332;
 Mon, 13 Jan 2020 16:03:04 -0600
Date: Mon, 13 Jan 2020 16:06:50 -0600
From: Benoit Parrot <bparrot@ti.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v5 5/5] MAINTAINERS: add entry for tidss
Message-ID: <20200113220650.p4dhulzhdhm6oxtm@ti.com>
References: <cover.1576857145.git.jsarha@ti.com>
 <fdb8bc85150c39e039869974b4160a36c71ec9b5.1576857145.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fdb8bc85150c39e039869974b4160a36c71ec9b5.1576857145.git.jsarha@ti.com>
User-Agent: NeoMutt/20171215
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
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, robh+dt@kernel.org,
 tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com, sjakhade@cadence.com,
 sam@ravnborg.org, maxime@cerno.tech
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jyri Sarha <jsarha@ti.com> wrote on Fri [2019-Dec-20 17:55:13 +0200]:
> Add entry for tidss DRM driver.
> 
> Version history:
> 
> v2: no change
> 
> v3: - Move tidss entry after omapdrm
>     - Add "T:     git git://anongit.freedesktop.org/drm/drm-misc"
> 
> v4: no change
> 
> v5: no change
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
