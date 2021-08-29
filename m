Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9023FAE05
	for <lists+dri-devel@lfdr.de>; Sun, 29 Aug 2021 21:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D252489C83;
	Sun, 29 Aug 2021 19:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCF489C83
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 19:32:47 +0000 (UTC)
Date: Sun, 29 Aug 2021 19:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1630265565;
 bh=dJZln88lN2ZOtbXwmt+yMlSaTT1Nk8VC901yTzLI2ig=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=jcERtoke82bMjrT4YI6VMnly6t2An9WrvCSsN0WX4Bqj2JuG7RXgsiRIQvC4fDq1l
 472BKhcVPkfOxXnbECZ7VrCqW+h3lxg02Uu8uNqaZKpei51bKmryT7B8EHLy3RmtUl
 es80LK8h/fewoTG3iOr+rCxe1QKRmbJG7yu/zH1naRZ963S8tdSnGcam6Rk+KUOm9l
 AwGPV6p8Oxw0oFSkI11GrugSCWJFrNFZdQYMWLpITVyLpI0Oa0k3TNHLJtSkZx9wEv
 AG5/k6MsLoxbGMOV0vnXEVQwjpbCiO9v/xZLsDu3/89kZ+PDAxaSjT34JxI6LHVcYi
 j/PQj2FK3Szog==
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/plane: Fix comment typo
Message-ID: <Et1WVGdWQKatnvgF0dk0__fJTr113F_1q4nPYkKG9BMEbOywRbg9NilposzUZNbnQX0PPVi31RpFzoOZ8cRD9gGH5KRC5haFB3pr8iLFUFI=@emersion.fr>
In-Reply-To: <20210829160401.4588-1-alyssa@rosenzweig.io>
References: <20210829160401.4588-1-alyssa@rosenzweig.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed to drm-misc-next, thanks!
