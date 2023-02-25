Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABB46A293A
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 12:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414CE10E129;
	Sat, 25 Feb 2023 11:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D530610E129
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 11:08:38 +0000 (UTC)
Date: Sat, 25 Feb 2023 11:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1677323316; x=1677582516;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=dmZJ3blwc/a2BHKtjRPKieHAlthKq3OHiYt2iVRf44w/S5uZu2gyuOXLp0oZ730c1
 CJfxtW0NdRZOr5FZlKFhcCxt4SUmxm2emyB4xbb39MVNueOSWGCaCATUVGFgrNnX+/
 JalOTufubWz3sbfvOHwcLOKQpcglZmpEAvZ0ZU7tBWRe6z84imrgmoLwXax3chDRdb
 X8fvVS1lZUGneCMx+qD+CIAEGJPSwhXWujxwm/NctcSUdKZVc0G551JNhkIV5dLxTr
 U9x/b+39DmYqy6y1/ueKekUw5H1PEX/vmkTluDfTCmHIC9cWcpmSzYK+v5bmxZl5wv
 qspTRCZcaLjrQ==
To: Petr Tesarik <petrtesarik@huaweicloud.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/prime: Fix documentation of
 drm_gem_prime_fd_to_handle()
Message-ID: <GLe6vWnaxm8W1VD0ltNz62HDAhn5b1rgraCJchuToDl-vb5m9gsGl2ml2xeTQfRwlWlTQXvqOUzYiSgz1GmOk76Jag5VR7Pzwm0iM-86igQ=@emersion.fr>
In-Reply-To: <20230224120931.1024-1-petrtesarik@huaweicloud.com>
References: <20230224120931.1024-1-petrtesarik@huaweicloud.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, petr@tesarici.cz,
 roberto.sassu@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
