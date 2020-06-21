Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70DC202925
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 08:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F257B6E431;
	Sun, 21 Jun 2020 06:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9ED76E417
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 06:36:28 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 49AA820021;
 Sun, 21 Jun 2020 08:36:26 +0200 (CEST)
Date: Sun, 21 Jun 2020 08:36:24 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: Re: [PATCH RESEND v2 0/4] panel-simple: CDTech S070PWS19HP-FC21 and
 S070SWV29HG-DC44, Tianma TM070JVHG33
Message-ID: <20200621063624.GF74146@ravnborg.org>
References: <20200612072219.13669-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612072219.13669-1-matthias.schiffer@ew.tq-group.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=8f9FM25-AAAA:8 a=e5mUnYsNAAAA:8
 a=kXfxDWqNk04gDUbaWmUA:9 a=CjuIK1q_8ugA:10 a=uSNRK0Bqq4PXrUp6LDpb:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthias

On Fri, Jun 12, 2020 at 09:22:15AM +0200, Matthias Schiffer wrote:
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> 
> This adds a few panels TQ-Systems uses with various starterkit
> mainboards. Device trees actually using these panels will be added with
> a later submission.
> 
> 
> Matthias Schiffer (2):
>   dt-bindings: display: simple: add CDTech S070PWS19HP-FC21 and
>     S070SWV29HG-DC44
>   dt-bindings: display: simple: add Tianma TM070JVHG33
> 
> Max Merchel (1):
>   drm/panel: simple: add Tianma TM070JVHG33
> 
> Michael Krummsdorf (1):
>   drm/panel: simple: add CDTech S070PWS19HP-FC21 and S070SWV29HG-DC44

Thanks, all applied to drm-misc-next.

	Sam

> 
>  .../bindings/display/panel/panel-simple.yaml  |  6 ++
>  drivers/gpu/drm/panel/panel-simple.c          | 75 +++++++++++++++++++
>  2 files changed, 81 insertions(+)
> 
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
