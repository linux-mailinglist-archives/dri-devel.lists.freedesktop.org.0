Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312193FDDBC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 16:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E788984D;
	Wed,  1 Sep 2021 14:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311D48984D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 14:20:45 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id c367492c-0b2f-11ec-9416-0050568cd888;
 Wed, 01 Sep 2021 14:20:31 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id DE6BA194B3A;
 Wed,  1 Sep 2021 16:20:33 +0200 (CEST)
Date: Wed, 1 Sep 2021 16:20:41 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Mack <daniel@zonque.org>
Cc: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v9 0/2] gpu: drm: add driver for ili9361 panel
Message-ID: <YS+MOZkE82ar827n@ravnborg.org>
References: <20210901103040.1419706-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901103040.1419706-1-daniel@zonque.org>
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

Hi Daniel,

On Wed, Sep 01, 2021 at 12:30:38PM +0200, Daniel Mack wrote:
> This is v9 of the series.
> 
> Changelog:
> 
> v2 -> v3:
> 	* Turn Documentation into yaml format

...

> Daniel Mack (2):
>   dt-bindings: display: add bindings for newhaven,1.8-128160EF
>   drm/tiny: add driver for newhaven,1.8-128160EF
> 
>  .../bindings/display/ilitek,ili9163.txt       |  27 +++

Despite the changelog the patch contains a .txt file.
Did you push the right patchset?

	Sam
