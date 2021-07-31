Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFE93DC79A
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 20:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03F96E8D8;
	Sat, 31 Jul 2021 18:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F3D6E8D8
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 18:19:53 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id e9e4c646-f22b-11eb-9082-0050568c148b;
 Sat, 31 Jul 2021 18:19:58 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 04E77194B35;
 Sat, 31 Jul 2021 20:20:11 +0200 (CEST)
Date: Sat, 31 Jul 2021 20:19:46 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Alistair Francis <alistair@alistair23.me>
Cc: robh+dt@kernel.org, thierry.reding@gmail.com, krzk@kernel.org,
 shawnguo@kernel.org, daniel@0x0f.com, linux@rempel-privat.de,
 kuninori.morimoto.gx@renesas.com, max.Merchel@tq-group.com,
 geert+renesas@glider.be, airlied@linux.ie, daniel@ffwll.ch,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alistair23@gmail.com,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] drm/panel: Add support for E Ink VB3300-KCA
Message-ID: <YQWUQsU2to1E7Ea4@ravnborg.org>
References: <20210729103358.209-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729103358.209-1-alistair@alistair23.me>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alistair,

On Thu, Jul 29, 2021 at 08:33:58PM +1000, Alistair Francis wrote:
> Add support for the 10.3" E Ink panel described at:
> https://www.eink.com/product.html?type=productdetail&id=7
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> v4:
>  - Fixup alphebetical sorting

Thanks for doing this so prompt.
Before we can apply the patch you also need to supply the
connector_type.
Please add, and send an updated version.

	Sam
