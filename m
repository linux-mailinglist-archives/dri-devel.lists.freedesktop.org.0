Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C7BA5D6BF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2359D10E0A8;
	Wed, 12 Mar 2025 07:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC4610E0A8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 07:00:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2CEB0A46CD7;
 Wed, 12 Mar 2025 06:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6DAC4CEE3;
 Wed, 12 Mar 2025 07:00:13 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
 id 334031806F4; Wed, 12 Mar 2025 08:00:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: arnd@arndb.de, lee@kernel.org, dmitry.torokhov@gmail.com, 
 sre@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, 
 alexandre.belloni@bootlin.com, danielt@kernel.org, jingoohan1@gmail.com, 
 deller@gmx.de, linus.walleij@linaro.org, brgl@bgdev.pl, 
 tsbogend@alpha.franken.de, linux@treblig.org
Cc: linux-mips@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250311014959.743322-7-linux@treblig.org>
References: <20250311014959.743322-1-linux@treblig.org>
 <20250311014959.743322-7-linux@treblig.org>
Subject: Re: [PATCH v2 6/9] power: supply: pcf50633: Remove charger
Message-Id: <174176280519.183324.14039063530250449155.b4-ty@collabora.com>
Date: Wed, 12 Mar 2025 08:00:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Tue, 11 Mar 2025 01:49:56 +0000, linux@treblig.org wrote:
> The pcf50633 was used as part of the OpenMoko devices but
> the support for its main chip was recently removed in:
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
> 
> See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/
> 
> Remove it.
> 
> [...]

Applied, thanks!

[6/9] power: supply: pcf50633: Remove charger
      commit: aae075a93f7705e29c599d101abc7e467125d871

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

