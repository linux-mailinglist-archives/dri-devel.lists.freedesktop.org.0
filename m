Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D997F1FE3C
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 05:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F7689261;
	Thu, 16 May 2019 03:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF598925E;
 Thu, 16 May 2019 03:41:17 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id e2so1338581vsc.13;
 Wed, 15 May 2019 20:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KCZgvULVS8AZ/nrQ5IWQSDdjVyIlgz7VAXZ7txeuOYA=;
 b=B/ktAdVMTuxaFWM/ZrbC+qrqBSbxzMm0XPoLumpAEZz0ChveuX8YvmHyoZkD2h7ZEP
 C/1B9aIb+UHpI/gJzIIL70zpupQPa7WWcjo7kWjaw7S7aTVwwKvENyuL0E9ELDLwTlmu
 8PRe96hWa7b/x5dccQqBg6LDD/dZUFB8+jWmv8T+Y4u6OdpliyAlh1C4g1dOV4MqkBWE
 r+FDGtL6cpVH7avDOAJi8N/CuVdq2/dyz0Kt0FilHqjIwKlspoSvKYC9jgGVM3UeXT/L
 U5wrW6DJqXyitTie9rHHfivCNE3aQHXQFl4JCupanxE9GHL9WM9tIK/7bBB1pYzAhYcg
 ol4A==
X-Gm-Message-State: APjAAAW6jUN0/ARnHveGzWEpzoIEkSnzotHmHUEoCOBO6M3qdK0eKnBM
 mqVO+a72qcmjmqny/HbrVGYnAIsREE+pU0OZ8r1BNw==
X-Google-Smtp-Source: APXvYqwV5DLsjSb66vr41Axav+yQIX3UjfnYyUcTzWtXWjWxMmGLmYszssWspv2zmkdEXsR5Ijj3aYF7heDmlyxgAI0=
X-Received: by 2002:a67:644:: with SMTP id 65mr20597613vsg.132.1557978076061; 
 Wed, 15 May 2019 20:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190514205701.5750-1-colin.king@canonical.com>
In-Reply-To: <20190514205701.5750-1-colin.king@canonical.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 16 May 2019 13:41:04 +1000
Message-ID: <CACAvsv5qD7LotsmK9Cv3XNH56sp8UmovOU3cxiE158oQwXS=jg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/bios/init: fix spelling mistake "CONDITON" ->
 "CONDITION"
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=KCZgvULVS8AZ/nrQ5IWQSDdjVyIlgz7VAXZ7txeuOYA=;
 b=fV3+35gXK5okEn4OXxJ9YOeXyT4wcPqNY5ybD1Kt//ncsebCg0t36rCNc2mpaMkkuw
 9TJtUtKuQNYalztwVz+Og28YUNeY/lJv+InGErLmmDLoYt/qeEcJeeOlxUtQdJIRSIXN
 iQXVb1TootdbBTgp8AHe5pKLzhT7WWpnrT7DlVnRscipCIg8dUxMVpIHjb4KiZ/JpkaK
 MbQTVEIjo1pshF2eYS3LVMY9OLufLuKCzzUMTKM8nMCnZo7xN6fWDZXt4Di8h+gCbYeU
 Dh2efqZkEiDbFYDUfLUdoSVrt9kh9/yQWHeF7PVWZ6iN8Q6VcSlXQpL5PTyGa89FxFfR
 ss2A==
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxNSBNYXkgMjAxOSBhdCAwNjo1NywgQ29saW4gS2luZyA8Y29saW4ua2luZ0BjYW5v
bmljYWwuY29tPiB3cm90ZToKPgo+IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNh
bm9uaWNhbC5jb20+Cj4KPiBUaGVyZSBpcyBhIHNwZWxsaW5nIG1pc3Rha2UgaW4gYSB3YXJuaW5n
IG1lc3NhZ2UuIEZpeCBpdC4KVGhhbmtzLCBtZXJnZWQuCgo+Cj4gU2lnbmVkLW9mZi1ieTogQ29s
aW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYmlvcy9pbml0LmMgfCAyICstCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jpb3MvaW5pdC5jIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYmlvcy9pbml0LmMKPiBpbmRleCBlYzBlOWY3MjI0
YjUuLjNmNGYyN2QxOTFhZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL3N1YmRldi9iaW9zL2luaXQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252
a20vc3ViZGV2L2Jpb3MvaW5pdC5jCj4gQEAgLTgzNCw3ICs4MzQsNyBAQCBpbml0X2dlbmVyaWNf
Y29uZGl0aW9uKHN0cnVjdCBudmJpb3NfaW5pdCAqaW5pdCkKPiAgICAgICAgICAgICAgICAgaW5p
dF9leGVjX3NldChpbml0LCBmYWxzZSk7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAg
ICAgZGVmYXVsdDoKPiAtICAgICAgICAgICAgICAgd2FybigiSU5JVF9HRU5FUklDX0NPTkRJVE9O
OiB1bmtub3duIDB4JTAyeFxuIiwgY29uZCk7Cj4gKyAgICAgICAgICAgICAgIHdhcm4oIklOSVRf
R0VORVJJQ19DT05ESVRJT046IHVua25vd24gMHglMDJ4XG4iLCBjb25kKTsKPiAgICAgICAgICAg
ICAgICAgaW5pdC0+b2Zmc2V0ICs9IHNpemU7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAg
ICAgICAgfQo+IC0tCj4gMi4yMC4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
