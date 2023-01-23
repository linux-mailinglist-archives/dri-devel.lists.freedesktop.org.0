Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E23167775D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 10:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B844310E32B;
	Mon, 23 Jan 2023 09:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A59D10E324
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 09:26:26 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1pJt5s-0000u0-NT; Mon, 23 Jan 2023 10:26:24 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1pJt5s-0000bh-5r; Mon, 23 Jan 2023 10:26:24 +0100
Date: Mon, 23 Jan 2023 10:26:24 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: sam@ravnborg.org
Subject: Re: [PATCH 52/86] drm/imx: Direct include headers from
 drm_atomic_helper
Message-ID: <20230123092624.GA30117@pengutronix.de>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
 <20230113-drm-include-v1-v1-52-c5cf72d8a5a2@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113-drm-include-v1-v1-52-c5cf72d8a5a2@ravnborg.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 21, 2023 at 09:08:30PM +0100, Sam Ravnborg via B4 Submission Endpoint wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Direct include the headers that otherwise comes indirect from
> drm_atomic_helper, because drm_atomic_helper will be reduced to
> include only the minimal set of headers.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
