Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB551FC957
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 10:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD3B6E384;
	Wed, 17 Jun 2020 08:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E156E384
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 08:58:40 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jlTtu-00071k-3n; Wed, 17 Jun 2020 10:58:30 +0200
Message-ID: <6ce028567aead7e5270c7d62b4f201bc686c0b3e.camel@pengutronix.de>
Subject: Re: [PATCH v5 0/2] mfd: Add ENE KB3930 Embedded Controller driver
From: Lucas Stach <l.stach@pengutronix.de>
To: Lubomir Rintel <lkundrak@v3.sk>
Date: Wed, 17 Jun 2020 10:58:28 +0200
In-Reply-To: <20200616224404.994285-1-lkundrak@v3.sk>
References: <20200616224404.994285-1-lkundrak@v3.sk>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lubomir,

Am Mittwoch, den 17.06.2020, 00:44 +0200 schrieb Lubomir Rintel:
> Hi,
> 
> please consider applying the patches chained to this message. It's the
> fifth version of the driver for the ENE KB3930 Embedded Controller.
> 
> This version is essentially a resend of v4. The only actual change is the
> addition of the Rob's Reviewed-by tag which I failed to do previously.
> Detailed change logs are in the individual patch descriptions.

I don't think you wanted this to go to the etnaviv list and
maintainers, right?

Regards,
Lucas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
