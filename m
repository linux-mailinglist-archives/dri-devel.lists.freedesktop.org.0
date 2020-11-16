Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8D42B4ED8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 19:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64ED6EA14;
	Mon, 16 Nov 2020 18:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3702C89A9F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 18:11:19 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 31B6780541;
 Mon, 16 Nov 2020 19:11:14 +0100 (CET)
Date: Mon, 16 Nov 2020 19:11:12 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Bernard Zhao <bernard@vivo.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/27] video: fix some kernel-doc markups
Message-ID: <20201116181112.GA103421@ravnborg.org>
References: <cover.1605521731.git.mchehab+huawei@kernel.org>
 <21661aed9892a1bacc7ef76a5dc9f5c7b37f5d8f.1605521731.git.mchehab+huawei@kernel.org>
 <20201116153606.GC401619@phenom.ffwll.local>
 <20201116173804.7d64f55f@coco.lan>
 <20201116172404.GD401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116172404.GD401619@phenom.ffwll.local>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=kjb6p09E1yaTWQ9aDqwA:9 a=CjuIK1q_8ugA:10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel
> > Feel free to just merge it via your tree. Patches here are pretty
> > much independent ;-)
> 
> Ok I put it into drm-misc-next. I kinda assumed since there's also a huge
> effort going on to shut up warnings, plus I think kerneldoc issues are
> reported by a bunch of build bots nowadays. So assumed you pile this all
> up.

Any reason "drm: fix some kernel-doc markups" was not applied?

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
