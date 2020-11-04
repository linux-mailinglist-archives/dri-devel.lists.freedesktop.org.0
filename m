Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BB52A6442
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 13:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA47F6ECF8;
	Wed,  4 Nov 2020 12:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41626ECF1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 12:27:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c17so2477589wrc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 04:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uinOFoWWChkPcAueiWNTIshof8R8Mb7vQCYYpe5kHl0=;
 b=QmawOvLl6iXGj119vGSrlEso2yJi/3rv2fNHS2YZZm9CjGCgGuaKexr4xE9mmTAuHT
 Zb+vFmC65b4VEaxpDcV62VgQQwcT1sqUiYTjO77OmxgY8UDoMpyovtDX3/ZFQNZ1X1PI
 TQd0Pue1InHLA2yS1XvAXq6T8Gdd+2QhMGRN0h15MPJf/xJKrXlMSjJxhq4foZmxnUpx
 XiMqhJ3mWMuvrODb1m0bpJ9427Z8edKUWLuQP4VpCuVXzmjgCBOPa7LQHapNXK1Wj391
 pKIo4jzMAxFI8aEJBjSVk8kjFkp5n6uIFxHCS42UZz4lQGdWfPuULaaRPphR/zYaXnfo
 rEaA==
X-Gm-Message-State: AOAM530356+X1Q5BTN4umPpUmnRRPAkiF84y1t0aAK4EB6XZ4IOQWLDd
 DraQUAiLoAfve+iLdCQGycA=
X-Google-Smtp-Source: ABdhPJwjAFrO9uAL9rPXfY/qcv0uliGPwbkLgq1LCBJhudXfsT1rau74Fov3WvKgPByU94BxgJ/pXw==
X-Received: by 2002:adf:f245:: with SMTP id b5mr4513573wrp.389.1604492842233; 
 Wed, 04 Nov 2020 04:27:22 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id c9sm2269890wrp.65.2020.11.04.04.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 04:27:21 -0800 (PST)
Date: Wed, 4 Nov 2020 13:27:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v8 3/7] MAINTAINERS: Add entry for Samsung interconnect
 drivers
Message-ID: <20201104122719.GB10157@kozik-lap>
References: <20201104103657.18007-1-s.nawrocki@samsung.com>
 <CGME20201104103722eucas1p1db939995e60d0bf2cd581070c14379f5@eucas1p1.samsung.com>
 <20201104103657.18007-4-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104103657.18007-4-s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 dri-devel@lists.freedesktop.org, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDQsIDIwMjAgYXQgMTE6MzY6NTNBTSArMDEwMCwgU3lsd2VzdGVyIE5hd3Jv
Y2tpIHdyb3RlOgo+IEFkZCBtYWludGFpbmVycyBlbnRyeSBmb3IgdGhlIFNhbXN1bmcgaW50ZXJj
b25uZWN0IGRyaXZlcnMsIHRoaXMgY3VycmVudGx5Cj4gaW5jbHVkZXMgRXh5bm9zIFNvQyBnZW5l
cmljIGludGVyY29ubmVjdCBkcml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3lsd2VzdGVyIE5h
d3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPgo+IC0tLQo+IENoYW5nZXMgc2luY2Ugdjc6
Cj4gIC0gbmV3IHBhdGNoLgo+IC0tLQo+ICBNQUlOVEFJTkVSUyB8IDcgKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJT
IGIvTUFJTlRBSU5FUlMKPiBpbmRleCBlNzM2MzZiLi40YmJhZmVmIDEwMDY0NAo+IC0tLSBhL01B
SU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtOTE1Niw2ICs5MTU2LDEzIEBAIEY6
CWluY2x1ZGUvZHQtYmluZGluZ3MvaW50ZXJjb25uZWN0Lwo+ICBGOglpbmNsdWRlL2xpbnV4L2lu
dGVyY29ubmVjdC1wcm92aWRlci5oCj4gIEY6CWluY2x1ZGUvbGludXgvaW50ZXJjb25uZWN0LmgK
PiAgCj4gK1NBTVNVTkcgSU5URVJDT05ORUNUIERSSVZFUlMKCkRvZXMgbm90IGxvb2sgbGlrZSBv
cmRlcmVkIGFscGhhYmV0aWNhbGx5LgoKPiArTToJU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3Jv
Y2tpQHNhbXN1bmcuY29tPgo+ICtNOglBcnR1ciBTd2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNv
bT4KPiArTDoJbGludXgtcG1Admdlci5rZXJuZWwub3JnCgpBbHNvOgpMOiBsaW51eC1zYW1zdW5n
LXNvY0B2Z2VyLmtlcm5lbC5vcmcKCj4gK1M6CVN1cHBvcnRlZAo+ICtGOglkcml2ZXJzL2ludGVy
Y29ubmVjdC9zYW1zdW5nCgpBZGQgdHJhaWxpbmcgLy4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9m
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
