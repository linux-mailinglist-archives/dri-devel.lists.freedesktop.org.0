Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7B45A78A0
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 10:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D337210E222;
	Wed, 31 Aug 2022 08:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F3D10E222
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 08:13:41 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oTIqr-0004SU-BX; Wed, 31 Aug 2022 10:13:33 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1oTIqo-0002rH-IT; Wed, 31 Aug 2022 10:13:30 +0200
Date: Wed, 31 Aug 2022 10:13:30 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH 0/6] TI SN65DSI83 Features
Message-ID: <20220831081330.mvy2ziuci3pklr7k@pengutronix.de>
References: <20220530150548.1236307-1-m.felsch@pengutronix.de>
 <20220726091228.nvvyzab7wyzrnfrr@pengutronix.de>
 <CAG3jFyt6A2L0Feeibv_76tVhQ_PjRpowQ=CeJ9FaOOshrEWLuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFyt6A2L0Feeibv_76tVhQ_PjRpowQ=CeJ9FaOOshrEWLuQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
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
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, jonas@kwiboo.se,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robert,

On 22-08-29, Robert Foss wrote:
> Hey Marco,
> 
> Sorry about the slow reply.
> 
> This series no longer applies on drm-misc-next. Can you rebase this
> series and send it out a v2?

I can but I would rather prefer to get some feedback first. Right now I
just got a minor documentation issue feedback from Alexander.

Regards,
  Marco
