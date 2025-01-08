Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41940A058BC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 11:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF0D10E833;
	Wed,  8 Jan 2025 10:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MO1leYDT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C96810E833
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 10:53:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6BAA75C44CD;
 Wed,  8 Jan 2025 10:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F66C4CEDD;
 Wed,  8 Jan 2025 10:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736333632;
 bh=MdzLiNiMUefIpEMjWF8sA0mgOuEA1ymjFocAvj83YU4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MO1leYDT/KQycCDok3dZtz1b6lChQeKjS47nI43y7an5N4Bourgc3jaRzijGYmyDR
 uEddCwqBeHSJREvXhnz1HfrlFH6cppD6r2xUMMaC8NO9RX1EyNQjz8nH0Ng7O/Jm5T
 k74EwS0aMvRpEWWVWjLm9Ix+ErZzdx1jcmEXC8/rhhKGJzwUYT0abRBFqdfyNqrsbN
 iyY+NNT4c2llVFqWtm8vzBFW/OjWbF59iCH5ZrbLJyw2xQY1Ta1NL+SDGaFcKp0FGY
 bQ3JT6KdT8EAlJuzOg4rJtqeb66RXgMjFsypTFOLuNhympArzLKxsPRouZoNuhZ+ZJ
 2JcCjRbMlesXg==
Date: Wed, 8 Jan 2025 10:53:45 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/3] MAINTAINERS: Add entries for Apple DWI backlight
 controller
Message-ID: <Z35ZOckf90QkbwHg@aspen.lan>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-4-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211113512.19009-4-towinchenmi@gmail.com>
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

On Wed, Dec 11, 2024 at 07:34:39PM +0800, Nick Chan wrote:
> Add MAINTAINERS entries for the driver.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
(keep this R-b if you rename any files)


Daniel.
