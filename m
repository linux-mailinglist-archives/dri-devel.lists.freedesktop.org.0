Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF8C2AA838
	for <lists+dri-devel@lfdr.de>; Sat,  7 Nov 2020 23:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD016E12C;
	Sat,  7 Nov 2020 22:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BB86E12C
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Nov 2020 22:17:48 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 067C82001E;
 Sat,  7 Nov 2020 23:17:45 +0100 (CET)
Date: Sat, 7 Nov 2020 23:17:44 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH v2 01/16] drm/encoder: remove obsolete documentation of
 bridge
Message-ID: <20201107221744.GA1052534@ravnborg.org>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <20200911135413.3654800-2-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911135413.3654800-2-m.tretter@pengutronix.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=bhWmGRyT7yQ3OOhjoyEA:9
 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
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
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 narmstrong@baylibre.com, b.zolnierkie@samsung.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com, krzk@kernel.org,
 kernel@pengutronix.de, sylvester.nawrocki@gmail.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 11, 2020 at 03:53:58PM +0200, Michael Tretter wrote:
> In commit 05193dc38197 ("drm/bridge: Make the bridge chain a
> double-linked list") the bridge has been removed and replaced by a
> private field. Remove the leftover documentation of the removed field.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hi Michael.

Applied to drm-misc-next, thanks.
The rest of this patch-set is exynos stuff, that the maintainer needs to
deal with but I will try to take a look at some of the patches.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
