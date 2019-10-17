Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07B4DB8D2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 23:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3056EAA6;
	Thu, 17 Oct 2019 21:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADBC6EAA6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 21:10:05 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twCjJ3XuEk4UDZYa_c8BR4K6D0DEVktay-Soaxrwkek6A@mail.gmail.com>
References: <CAPM=9twCjJ3XuEk4UDZYa_c8BR4K6D0DEVktay-Soaxrwkek6A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twCjJ3XuEk4UDZYa_c8BR4K6D0DEVktay-Soaxrwkek6A@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2019-10-18
X-PR-Tracked-Commit-Id: 5c1e34b5159ec65bf33e2c1a62fa7158132c10cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 839e0f04b50441d1f6593070b574b7933e903c7c
Message-Id: <157134660491.21346.5449126901245273926.pr-tracker-bot@kernel.org>
Date: Thu, 17 Oct 2019 21:10:04 +0000
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571346604;
 bh=bXdvTXzHicshgQU7A306M8DvJ2HYKgVe4uQXzS+CrDA=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Qi7ztRjI0mx1sl9UF8nosrNQvBuBdOchlXAbKs9yN81wvYiVQypCep7ByHZo6z/1N
 afcHuM+4B4jPIx6bJYuSNqRQaqXfpTA6ucGGCh1jdCcA4pgLL6Vmxv5y0osA9rumal
 f35ibsOl/RxSvzKwhiduiXCakwXQvusHN/ScDz/o=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDE4IE9jdCAyMDE5IDA2OjUzOjU1ICsx
MDAwOgoKPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtIHRhZ3MvZHJtLWZp
eGVzLTIwMTktMTAtMTgKCmhhcyBiZWVuIG1lcmdlZCBpbnRvIHRvcnZhbGRzL2xpbnV4LmdpdDoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy90b3J2YWxkcy9jLzgzOWUwZjA0YjUwNDQxZDFmNjU5MzA3
MGI1NzRiNzkzM2U5MDNjN2MKClRoYW5rIHlvdSEKCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEg
Ym90LgpodHRwczovL2tvcmcud2lraS5rZXJuZWwub3JnL3VzZXJkb2MvcHJ0cmFja2VyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
