Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0630047A190
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 18:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D2414A363;
	Sun, 19 Dec 2021 17:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B5614A364
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 17:39:15 +0000 (UTC)
Date: Sun, 19 Dec 2021 17:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1639935553;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=uZDh9Gnakqkn8Wjqov5kP/6W7j4ifjH1KC5obdF6AKrezHe37IIK0P/hBU2UebnDb
 b+XnGxGurDg4XtWDXIiRDcLFo5KCgzIblIZW7Y31+xU3yiJeYVo/y7oRl66nDBQHwX
 zNnsRC/ST26JcImJ6p0g5xXUazLdy9kgrreUc9WcbmHBY+bUImAebUVomV+PKdDW4Z
 Z9cM65k831pGVHjcMipnDLbh5cwp69hBhh3uzgfVwwiRBnWfAkzW3/WKGFSgXYNL1R
 bX7n2ViYeddjfB/jMh4djWV1YziNoYCQ7vgjmwOA4xuutqSkXBdODHAcjDZ8hGSLaN
 ofukXU9S/8Cqw==
To: Randy Dunlap <rdunlap@infradead.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: drm/drm_file.h: fix a kernel-doc typo
Message-ID: <cveAtlEq1z9u4pIsIW6bD4DbcF10JoepIKlc30RIxK6Jh4k723uWgH5FAsgyLlgB6TNIEbHbbf1ye_bnYKlMsnj6NLDcujQFscsn7GqB7J8=@emersion.fr>
In-Reply-To: <20211219173728.9806-1-rdunlap@infradead.org>
References: <20211219173728.9806-1-rdunlap@infradead.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
