Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A311D0AFF
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 10:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F89F6E150;
	Wed, 13 May 2020 08:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FCE6E150
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 08:42:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id D51772A2601
Date: Wed, 13 May 2020 10:42:17 +0200
From: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: analogix_dp.txt: convert to yaml
Message-ID: <20200513084217.nqvhcmlbu727f6ae@rcn-XPS-13-9360>
References: <20200424112634.20863-1-ricardo.canuelo@collabora.com>
 <20200511213108.GA3374@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511213108.GA3374@bogus>
User-Agent: NeoMutt/20171215
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
Cc: airlied@linux.ie, devicetree@vger.kernel.org, kernel@collabora.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thanks for reviewing the patch and  I'm sorry it had so many mistakes,
this was my first attempt at converting a DT binding to schema.

On lun 11-05-2020 16:31:08, Rob Herring wrote:
> > This binding is meant to be used in conjunction with
> > Documentation/bindings/display/rockchip/analogix_dp-rockchip.txt
> > and
> > Documentation/bindings/display/exynos/exynos_dp.txt
> > 
> > I was careful to define the bindings to be flexible enough for both
> > cases, since the properties might be slightly different depending
> > on the SoC.
> 
> They need to be converted all at once to schema.

I'll queue that up to work on next and I'll try to come up with a good
patch series to convert the three bindings.

Cheers,
Ricardo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
