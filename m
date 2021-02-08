Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEA1313012
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 12:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69776E3B2;
	Mon,  8 Feb 2021 11:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0776E3B2
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 11:06:55 +0000 (UTC)
Date: Mon, 08 Feb 2021 11:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1612782412;
 bh=U0MZUFxkg3+UOPqNFrbWaEyCbKpVVLhO0H5Klvvg8Vk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=eX9rIiFg7ZztZk61awinuelrVmWW0HaIyNGdvyzvRmzPToPyohoXDZABwzdBCJYJ3
 iFLWytaruu0YZVjS2NZ5xUXZV23DNZDr50ygr4EJk//4rgXkgP0k9KxxGSsE/mojBq
 SEpy/Zpa31K+8JBR16lh2MEmS4lngbrJGtFIgqm5t0IvMIgCC8ij3h6tmqTi0FX2XF
 kTYSAgQXfkYdfztVzOUQwCeIS06akTim+7mb20IYk8Undq+dSC0CBYc55LQeXXNByr
 jhemCTn2kWbl6cY4JTI/XCvs+vYC4ESWi3UWQWZYWtpnN0Qdimix3p44KrS3fq8/nC
 L5IPdUzkBQKiQ==
To: James Park <jpark37@lagfreegames.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: DRM_FOURCC_STANDALONE macro support
Message-ID: <PFzaVEas7PLNKlfUzHiy540wMMMMWVvYAWVkfC83turk2AcQQGZJOxbu7pB3jmaVrHIsKCMV3t04kwZQEjsjUcP_JmS-VD9v5En6HPv25g4=@emersion.fr>
In-Reply-To: <1612493666-757-1-git-send-email-jpark37@lagfreegames.com>
References: <1612493666-757-1-git-send-email-jpark37@lagfreegames.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Simon Ser <contact@emersion.fr>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
