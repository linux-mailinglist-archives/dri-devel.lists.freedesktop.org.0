Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C26C2D8E78
	for <lists+dri-devel@lfdr.de>; Sun, 13 Dec 2020 17:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5042A899E9;
	Sun, 13 Dec 2020 16:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17AC6E105
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Dec 2020 15:58:32 +0000 (UTC)
X-Gm-Message-State: AOAM533lQTRxiAtfcPBBKPRL9l7WKydh8W0vzSWGiFA6NWDAXKebfwBp
 o9qitIhE8LdEX8dS5R+QXEuLm9GHmZkgh/Dmcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607875112;
 bh=TUEXd1NufKhBjH3w0YLBQgI4G4nF26Jpf12BZg2DdkU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vJRnrzs7P6heS4pWkFfwEyWeiYDaKgI8pRS8Vf5gSRcEtXB5EwUnu+gviqkUk2kx8
 UJtwlNtQFpdWCpJJ4Q3u99L6dtww4ZH8/QzHtnR4TT/9kBlGAdZibwxZquibbdFPsS
 JGPg4q+sP/2ZD4BbS7ZoMFGDLMxOIH2Z2yJs/3Jx0XM8fVZ523kAmK2y/BRM8MRbkh
 oVcZLY0MU6VthHzq/YwAAnRAEfeoyBmjEQbReRd3FxlEhBVGXJRShrQfO3VIw4VWUQ
 vlais4qeT+kLJAkJBZOomUre3HjGXg7d/q5yBUmmKzbjIunjf3i/EbN4EMXzfQNWVv
 ps7CcvvE3qjjA==
X-Google-Smtp-Source: ABdhPJzQ7X5J5ZOuZiSIqmWQH6RPNRgCbzq8nEgfd2GgED4aXNSwfqseLuR73PpirrPAI1Pa+7yPj6L3B8AH6G4uL4U=
X-Received: by 2002:aa7:dbca:: with SMTP id v10mr5100096edt.219.1607875110439; 
 Sun, 13 Dec 2020 07:58:30 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-4-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607746317-4696-4-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 13 Dec 2020 23:58:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9p0J0uMRu1gzkgCzj3uf=1gKPjubAbkx-aYY=rRuc3Pw@mail.gmail.com>
Message-ID: <CAAOTY_9p0J0uMRu1gzkgCzj3uf=1gKPjubAbkx-aYY=rRuc3Pw@mail.gmail.com>
Subject: Re: [PATCH v2, 03/17] dt-bindings: mediatek: add description for
 mt8192 display
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMTLml6Ug6YCx5YWtIOS4i+WNiDEyOjEy5a+r6YGT77yaCj4KPiBh
ZGQgZGVzY3JpcHRpb24gZm9yIG10ODE5MiBkaXNwbGF5CgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3Fp
YW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gaW5kZXggZGZiZWM3
Ni4uYjRlNjJhZSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0
Cj4gQEAgLTQ0LDcgKzQ0LDcgQEAgUmVxdWlyZWQgcHJvcGVydGllcyAoYWxsIGZ1bmN0aW9uIGJs
b2Nrcyk6Cj4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRwaSIgICAgICAgICAgICAgICAgICAg
LSBEUEkgY29udHJvbGxlciwgc2VlIG1lZGlhdGVrLGRwaS50eHQKPiAgICAgICAgICJtZWRpYXRl
ayw8Y2hpcD4tZGlzcC1tdXRleCIgICAgICAgICAgICAtIGRpc3BsYXkgbXV0ZXgKPiAgICAgICAg
ICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1vZCIgICAgICAgICAgICAgICAtIG92ZXJkcml2ZQo+IC0g
IHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQ3NjIzLCBtdDI3MTIsIG10ODE3MyBh
bmQgbXQ4MTgzLgo+ICsgIHRoZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQ3NjIzLCBt
dDI3MTIsIG10ODE3MywgbXQ4MTgzIGFuZCBtdDgxOTIuCj4gIC0gcmVnOiBQaHlzaWNhbCBiYXNl
IGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgZnVuY3Rpb24gYmxvY2sgcmVnaXN0ZXIgc3BhY2UK
PiAgLSBpbnRlcnJ1cHRzOiBUaGUgaW50ZXJydXB0IHNpZ25hbCBmcm9tIHRoZSBmdW5jdGlvbiBi
bG9jayAocmVxdWlyZWQsIGV4Y2VwdCBmb3IKPiAgICBtZXJnZSBhbmQgc3BsaXQgZnVuY3Rpb24g
YmxvY2tzKS4KPiAtLQo+IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
