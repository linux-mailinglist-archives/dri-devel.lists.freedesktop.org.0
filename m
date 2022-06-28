Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B41B455BE8C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 07:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D29C113C4F;
	Tue, 28 Jun 2022 05:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D47D113C4F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 05:57:26 +0000 (UTC)
Date: Tue, 28 Jun 2022 05:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1656395843; x=1656655043;
 bh=m4z6gVadcGbVtyF3I8oWXqiPAQ5Cu/iRMHvkRQTz0Fo=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=aeHr9DPOHcK0IlXY9kMLNqWT9Z6B/zBczoQTSqpGYcbnubRuvH8/zu7MvTJjo/GS2
 ydxRVbuSU2TsXwB1112hYFlZhEiZrEJ3p/xiOGp8dakscoZR/jB6paQyxs9y6+MDEs
 i7Htk33dWJQiEMhPa5V9Mo6B7EQIPI1RfpQ94S7OIbQPSK94QVJylfWbKItn0rdqPu
 2y3YegvxfLW6s31Uoc925CUncVBaCpVCKpQR4FhdQgImVFHYRlpgT7Pq7mONxeKSO7
 YxY2d/Jfy5fDVHLCGa8RjKp57joR1lK9598WCZqZaNFYQjSb+5uPCKKYBpIdYBy3Hq
 4GaRmOlW7npWw==
To: Marek Vasut <marex@denx.de>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/doc: Fix comment typo
Message-ID: <FczjXgyDTspF73PGf0J-98YU-y0C3-K5vIAUcrrY0IPQPQBhtO8a96A4pm7sFeWu03QQPXg2cRsLgXwUr8z5n5o60ROlfQS8boMVofPbTxs=@emersion.fr>
In-Reply-To: <20220628003407.77765-1-marex@denx.de>
References: <20220628003407.77765-1-marex@denx.de>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: robert.foss@linaro.org, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>

Pushed to drm-misc-next, thanks!
