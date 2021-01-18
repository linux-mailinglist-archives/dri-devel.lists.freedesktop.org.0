Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025472F9F5A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 13:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A818E6E1D8;
	Mon, 18 Jan 2021 12:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283CB6E1D8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 12:19:52 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1l1TVb-0003kl-8b; Mon, 18 Jan 2021 13:19:47 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: sam@ravnborg.org, Heiko Stuebner <heiko@sntech.de>,
 thierry.reding@gmail.com
Subject: Re: [PATCH] drm/panel: panel-simple: add bus-format and
 connector-type to Innolux n116bge
Date: Mon, 18 Jan 2021 13:19:45 +0100
Message-Id: <161097237013.280087.214437214113895613.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109130951.3448435-1-heiko@sntech.de>
References: <20210109130951.3448435-1-heiko@sntech.de>
MIME-Version: 1.0
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
Cc: airlied@linux.ie, Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 9 Jan 2021 14:09:51 +0100, Heiko Stuebner wrote:
> The Innolux n116bge panel has an eDP connector and 3*6 bits bus format.

Applied, thanks!

[1/1] drm/panel: panel-simple: add bus-format and connector-type to Innolux n116bge
      commit: 87969bcd49480508568070fd93d7367f03316aa9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
