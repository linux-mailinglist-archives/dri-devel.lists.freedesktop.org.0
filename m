Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3700349491
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 15:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB6E6ED9F;
	Thu, 25 Mar 2021 14:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0547B6ED99
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 14:50:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D55C61A10
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 14:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616683824;
 bh=gXKf4S8+61HKOZyFOVaAxqwer2cxjoMEzIs0jhgOClQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RxqZiJ1+PE+fSHc0f7b8XlozK1UzYagYiD+XHk89yhBpm1wVn5K7nSND7k+VwdKTj
 O+Q+8xR2sF8JGgh9A5cbPJfPF1M8foWdILcNd7ONzIc4kfNgcXFuI4u3ZW+GbZDTh7
 sZ4Ss4+6fUv8WjxhFkF/5YFhVn4ohz2zacL1kk4vmpRo6X6RBKRcxwm2nD1gMiF4b9
 gkFQ9hnRIYrwxE8+Vsv4MPQgh7hLx72wOJ2uy8mY5bp5BL7MSDbLtkEXK1iar6NTF7
 REXP2Ltdcfe0DlCMlxK/c2ZpcZ8kSqxel7Pvi4cZOjDlzyAzCURlnbgHdX8BNBET5U
 N2BrC3rzmBq6A==
Received: by mail-ej1-f46.google.com with SMTP id ce10so3367324ejb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 07:50:24 -0700 (PDT)
X-Gm-Message-State: AOAM530k4rvszKxmj9PLeScEfNaTQ7Z9ynuI0AklPwI2wRe6tn9vQ64/
 U1J9ViYbJcJOY6cDT1k2O4dNTCCFnbwJ4AGzEw==
X-Google-Smtp-Source: ABdhPJx3tGzBEWxXeZqHjtFE3s2YBfKCjbp0HdPAZ9VH4JPdIzt6nZLKrGikC9YrzzRcQ2af++5VziyxrNwMXikGiec=
X-Received: by 2002:a17:907:3e8a:: with SMTP id
 hs10mr9965188ejc.267.1616683822980; 
 Thu, 25 Mar 2021 07:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210325130728.16634-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20210325130728.16634-1-dafna.hirschfeld@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 25 Mar 2021 22:50:11 +0800
X-Gmail-Original-Message-ID: <CAAOTY_80C++G3xM_Xmi+8uA7J9ixd8rQTZ4VKCtURH-8Cc6S6Q@mail.gmail.com>
Message-ID: <CAAOTY_80C++G3xM_Xmi+8uA7J9ixd8rQTZ4VKCtURH-8Cc6S6Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add linux-mediatek ML for drm Mediatek
 drivers
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 dafna3@gmail.com, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERhZm5hOgoKRGFmbmEgSGlyc2NoZmVsZCA8ZGFmbmEuaGlyc2NoZmVsZEBjb2xsYWJvcmEu
Y29tPiDmlrwgMjAyMeW5tDPmnIgyNeaXpSDpgLHlm5sg5LiL5Y2IOTowN+Wvq+mBk++8mgo+Cj4g
QWRkIHRoZSBsaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QgdG8gZHJtIE1lZGlhdGVrIGRyaXZl
cnMKPgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUv
bGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4K
Cj4gU2lnbmVkLW9mZi1ieTogRGFmbmEgSGlyc2NoZmVsZCA8ZGFmbmEuaGlyc2NoZmVsZEBjb2xs
YWJvcmEuY29tPgo+IC0tLQo+ICBNQUlOVEFJTkVSUyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJT
Cj4gaW5kZXggOWU4NzY5MjdjNjBkLi44MjYwYmM1YWZlNjYgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRB
SU5FUlMKPiArKysgYi9NQUlOVEFJTkVSUwo+IEBAIC01OTYzLDYgKzU5NjMsNyBAQCBEUk0gRFJJ
VkVSUyBGT1IgTUVESUFURUsKPiAgTTogICAgIENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBr
ZXJuZWwub3JnPgo+ICBNOiAgICAgUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5k
ZT4KPiAgTDogICAgIGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiArTDogICAgIGxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcgKG1vZGVyYXRlZCBmb3Igbm9uLXN1YnNj
cmliZXJzKQo+ICBTOiAgICAgU3VwcG9ydGVkCj4gIEY6ICAgICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay8KPiAgRjogICAgIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay8KPiAtLQo+IDIuMTcuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
