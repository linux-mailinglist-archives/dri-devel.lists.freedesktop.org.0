Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A2E811610
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 16:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF2310E2DC;
	Wed, 13 Dec 2023 15:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5461510E273
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 15:22:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 702DB61BD2;
 Wed, 13 Dec 2023 15:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8C5C433C9;
 Wed, 13 Dec 2023 15:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702480948;
 bh=C9ACrIQx0YJY336SuskexKm54RVQGARkMiX7As8+5/w=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YRdNcSRaSfzN37r/VJOnPw7e5IES2F4lg3fgd2MNWAbfQxG7YqsWjstIrWYtnxakk
 1n/V0E3NVymizqLBulu2cZM0CgiJo5doF1XOdIQ8YsigCofc50Lup7RQ137OSl1Hfm
 A/M6E31a3gHZqgwI8gVeOtQcNg0Pf3OBL1Qp7Kak/aPfthzuFANiIlQWqwcKCB5VuY
 uD/VizduZFgZD3f2XlhEcpDKDrnOSypHS9kLYAB1MTEiEstIdXjP+YATrn4deMR7gp
 UOBd2tsUE3WvKEzq84/YLkBrXfFZybIsGpBApfwSMRMMVDpDcBnu4ILCsZsHuSP5dx
 iqOBexE3c7zLQ==
From: Maxime Ripard <mripard@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231213112432.2002832-1-dario.binacchi@amarulasolutions.com>
References: <20231213112432.2002832-1-dario.binacchi@amarulasolutions.com>
Subject: Re: (subset) [linux-next:master] drm/panel: synaptics-r63353:
 adjust the includes
Message-Id: <170248094564.191897.4619829546699320404.b4-ty@kernel.org>
Date: Wed, 13 Dec 2023 16:22:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: neil.armstrong@linaro.org, tzimmermann@suse.de, sam@ravnborg.org,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, michael@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Dec 2023 12:24:32 +0100, Dario Binacchi wrote:
> Adjust the includes to explicitly include the correct headers.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

