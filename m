Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539DA3BA7F5
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 11:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BE66E18F;
	Sat,  3 Jul 2021 09:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6AF6E1E9;
 Sat,  3 Jul 2021 09:00:06 +0000 (UTC)
Date: Sat, 03 Jul 2021 09:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1625302803;
 bh=bh7EqPBSxD7P0sFIwjUGPVXk5inH7QT2SLxv4vJUnxM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=uKToOwdJAXk/AVaBEn+cTXOICdi8xkNcy99a/jle7KDl2C/uUR21XDBgTQXZ/UhQH
 3rNoExoJaLw8yoB2rhCXAfb8kJJ8tnX9ouE5qEWyn0nblI/zD7lM3btLFqnzaSlq7z
 25qB6N+e4aEdrL2hIMzoqRSC8Yhya0tv9UzyTwbg16N2r7Qg+tIX959cC80NTAXLfi
 ysVmtIRvdzeyya//7XvBdQIPn4RcRDHJtjoZs8HdTnb6EhOhSN7qoTWTMOoHTjy43p
 vggHDpukZ8RjVcyuG7cS+CpJdGw36Nlk+9DBGrRqAKipWyZBUzvDJFi2dLHQJMxYwr
 cdR1lQug1hCdQ==
To: gushengxian <gushengxian507419@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] include/uapi/drm: fix spelling mistakes in header files
Message-ID: <anhfX5shNJsdNd6vWMeQqNTawyT0AGuoZYI7yRItB-il7fywDu9_Ie1kKL7Wwv2ecVxiYaoymsZHpufnuxUBqvja2uq0_t-Qmhhc4uHT5f0=@emersion.fr>
In-Reply-To: <20210703072502.646239-1-gushengxian507419@gmail.com>
References: <20210703072502.646239-1-gushengxian507419@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 tzimmermann@suse.de, lima@lists.freedesktop.org, airlied@linux.ie,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, yuq825@gmail.com,
 gushengxian <gushengxian@yulong.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>

But this this touches a lot of different drivers, not sure we can just
merge this via drm-misc-next?

In any case, please ping me again in a week if this hasn't been merged
by then.
