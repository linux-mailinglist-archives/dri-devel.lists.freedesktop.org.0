Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B242B2770D1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 14:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0756EACF;
	Thu, 24 Sep 2020 12:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903876EACF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 12:23:35 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w5so3576356wrp.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PtKTSY41aN1c2YuBo2WSiO9cWck/dx6VHgtWV4uIRZY=;
 b=JTw9rlKqb7OA6x+z5c1wx9ysAooN1pK080IGSL+W35JC7huBDX4ODEhwa9uX9gS/ot
 JEVVjHvndcj5/E5EzEOC5riFAwzXaybbulwl6mgodr25RK+mfdfKEUDvxRZWNIUgbpl4
 j4g0hcpdhVYblF1r6JUgpqOPid/6OEcM6CIcaVrg2YWW/rXAwuQKuPOU/a2zxO8SGtRS
 g3mTZ2FqLPc7o8kVlyVXuyqVMKetHSqpmMQUoB1T/XsWl3yCTWcgcXeU7txgvZzMiMRt
 EgR2nJWLr8t+D2qENoyn2l8rn6hcUr9p/E8EswMTPZMieAVp6dnmeCnKd1vT+46+SugJ
 dBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PtKTSY41aN1c2YuBo2WSiO9cWck/dx6VHgtWV4uIRZY=;
 b=QDsRQRVLRSaNghPJvjskZuqDuP+uANLcWv6vytLX617xrYNYih9mzn71RCwtXa6XAA
 x9gb8d/vcRFvoiBYpxvxJJWznM31lw41qwZxaxi9N+siTDipxqB2U7tvMFIqptF1RPhY
 UhJ+1LVYk9ZYw6AN5RdQVAC1vGHK0P7QYzMuqnQWwV8W6uLH3OUZ+HgghhbiytZeicwM
 P963Y11lx6RGt2a5cDbHMpWtAigwO3derQ0HU0VRW+6zlFsvsqxaJiUEfIqkWb2BPzYw
 pEr/i03AiZbqHbWER+dtOvRrR2vsLQBk/BmTini1ctqkt7hMlg6yKpm2wACXJsyciikE
 Ct8A==
X-Gm-Message-State: AOAM530iK8RDDMs9K+5DlAbrQAxY2KrDELaCkP9XjrS3/tQMuFpROzAO
 pEmdVftXvudh7aiDXMVB4zXwxQ==
X-Google-Smtp-Source: ABdhPJy7ULYZbpEC8tfOVe9Mmk1pHPqjw5QNKn8R14l+Rp01r1fpkEf03DuUAi+CWOla+NWxotL9FA==
X-Received: by 2002:a5d:458a:: with SMTP id p10mr4714560wrq.282.1600950214250; 
 Thu, 24 Sep 2020 05:23:34 -0700 (PDT)
Received: from dell ([91.110.221.204])
 by smtp.gmail.com with ESMTPSA id m13sm3500600wrr.74.2020.09.24.05.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 05:23:33 -0700 (PDT)
Date: Thu, 24 Sep 2020 13:23:31 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] MAINTAINERS: add Dan Murphy as TP LP8xxx drivers
 maintainer
Message-ID: <20200924122331.GI4678@dell>
References: <20200922152839.2744-1-krzk@kernel.org>
 <fe4609b5-5aab-46ed-5280-9a4742b97fe5@ti.com>
 <20200923205857.5af407ee@archlinux>
 <CAJKOXPdWD47OvK7qQ4Md2t3U=NmSf=j5hNjBq4+8CgZKLdup=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJKOXPdWD47OvK7qQ4Md2t3U=NmSf=j5hNjBq4+8CgZKLdup=Q@mail.gmail.com>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-iio@vger.kernel.org, linux-pm@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyNCBTZXAgMjAyMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4gT24gV2Vk
LCAyMyBTZXAgMjAyMCBhdCAyMjowMSwgSm9uYXRoYW4gQ2FtZXJvbiA8amljMjNAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCAyMyBTZXAgMjAyMCAxMTo1MzozMyAtMDUwMAo+ID4g
RGFuIE11cnBoeSA8ZG11cnBoeUB0aS5jb20+IHdyb3RlOgo+ID4KPiA+ID4gSGVsbG8KPiA+ID4K
PiA+ID4gT24gOS8yMi8yMCAxMDoyOCBBTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+
ID4gPiBNaWxvIEtpbSdzIGVtYWlsIGluIFRJIGJvdW5jZXMgd2l0aCBwZXJtYW5lbnQgZXJyb3Ig
KDU1MDogSW52YWxpZAo+ID4gPiA+IHJlY2lwaWVudCkuICBMYXN0IGVtYWlsIGZyb20gaGltIG9u
IExLTUwgd2FzIGluIDIwMTcuICBNb3ZlIE1pbG8gS2ltIHRvCj4gPiA+ID4gY3JlZGl0cyBhbmQg
YWRkIERhbiBNdXJwaHkgZnJvbSBUSSB0byBsb29rIGFmdGVyOgo+ID4gPiA+ICAgLSBUSSBMUDg1
NXggYmFja2xpZ2h0IGRyaXZlciwKPiA+ID4gPiAgIC0gVEkgTFA4NzI3IGNoYXJnZXIgZHJpdmVy
LAo+ID4gPiA+ICAgLSBUSSBMUDg3ODggTUZEIChBREMsIExFRHMsIGNoYXJnZXIgYW5kIHJlZ3Vs
YXRvcikgZHJpdmVycy4KPiA+ID4gPgo+ID4gPiA+IENjOiBEYW4gTXVycGh5IDxkbXVycGh5QHRp
LmNvbT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtl
cm5lbC5vcmc+Cj4gPiA+Cj4gPiA+IEFja2VkLWJ5OiBEYW4gTXVycGh5IDxkbXVycGh5QHRpLmNv
bT4KPiA+ID4KPiA+IE5vdCBzdXJlIHdobyB3aWxsIHBpY2sgdGhpcyBvbmUgdXAsIGJ1dAo+ID4g
QWNrZWQtYnk6IEpvbmF0aGFuIENhbWVyb24gPEpvbmF0aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4K
PiAKPiBJIGd1ZXNzIHdob2V2ZXIgaXMgZmlyc3QuIDopCj4gVGhpcyBzcGFucyBhY3Jvc3Mgc3lz
dGVtcyBidXQgdGhlIGNvbW1vbiBwYXJ0IGlzIE1GRCwgc28gbWF5YmUgTGVlIC0KPiBjb3VsZCB5
b3UgcGljayBpdCB1cD8KClllcywgSSdsbCBoYW5kbGUgaXQuCgotLSAKTGVlIEpvbmVzIFvmnY7n
kLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8u
b3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzog
RmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
