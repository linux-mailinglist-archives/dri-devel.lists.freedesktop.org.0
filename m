Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 355004F7BC
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 20:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C496E817;
	Sat, 22 Jun 2019 18:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D83B6E817
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 18:10:24 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id m24so529428ioo.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 11:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l8d48d9b5sI/lf04I2pGaS6zccQn8vsOnJboHKqEaBc=;
 b=f1xyIfJ70EdG8OpZY0uR+oc7L9ro6pI7yjvBg50Rh94zVFRA5BTLiZjyoKHGo5Ugvh
 x82Mnh6ybfNYMcqdMxbS8LKckmiebTdqDTpNdAX9RVGviwXjLsT9r6HAolWWvcUvU71j
 5d2E5MHfPHAYS3Z8NegG4R6Fd+MjfELfQoKj8f3x+7aPc5bFgGJJBDLDLq6pZ03M/rSC
 feyy7qlLlGC+izKLis/W8vpO3Ph+ydr9PwOApHBn5kNm6LiQ/DGLLGvAwlSX5cy/SYEI
 FTX2HeVkDH9ml+A4/oQ5WN7pWzADTNSkZthYVtieM5nllldhP+EdpED+B4fh/a6+gmJt
 cz6g==
X-Gm-Message-State: APjAAAVaRF9zrjdMKBfl+oLSaFdIzuWQ9xtsnPOLa5n3yLPtVi9Qifj7
 mgCrgbsS5DkEDEl0Ferlj4KvURH0Eqeog4e2wsc3iw==
X-Google-Smtp-Source: APXvYqxbQh9MeAYw4pY0HRN+jx7mWB8E2EKq4M+LS1g6IK/DeDaxVFNdQaB3IyM+i8dRiQkXxLh4QrBGgpuj30JEoq0=
X-Received: by 2002:a02:70d6:: with SMTP id
 f205mr22012440jac.138.1561227023845; 
 Sat, 22 Jun 2019 11:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190620001343.11046-1-imirkin@alum.mit.edu>
 <20190621181026.GG21486@arch-x1c3>
In-Reply-To: <20190621181026.GG21486@arch-x1c3>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 22 Jun 2019 20:10:12 +0200
Message-ID: <CACO55tsz6gqjbG8f2GMgFp3vQEVoGyMBy8jbqgRKJ4OungfcdQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix bogus GPL-2 license header
To: Emil Velikov <emil.l.velikov@gmail.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgoKT24gRnJpLCBKdW4g
MjEsIDIwMTkgYXQgODoxMiBQTSBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiBPbiAyMDE5LzA2LzE5LCBJbGlhIE1pcmtpbiB3cm90ZToKPiA+IFRoZSBi
dWxrIFNQRFggYWRkaXRpb24gbWFkZSBhbGwgdGhlc2UgZmlsZXMgaW50byBHUEwtMi4wIGxpY2Vu
c2VkIGZpbGVzLgo+ID4gSG93ZXZlciB0aGUgcmVtYWluZGVyIG9mIHRoZSBwcm9qZWN0IGlzIE1J
VC1saWNlbnNlZCwgdGhlc2UgZmlsZXMKPiA+IChwcmltYXJpbHkgaGVhZGVyIGZpbGVzKSB3ZXJl
IHNpbXBseSBtaXNzaW5nIHRoZSBib2lsZXIgcGxhdGUgYW5kIGdvdAo+ID4gY2F1Z2h0IHVwIGlu
IHRoZSBnbG9iYWwgdXBkYXRlLgo+ID4KPiA+IEZpeGVzOiBiMjQ0MTMxODBmNSAoTGljZW5zZSBj
bGVhbnVwOiBhZGQgU1BEWCBHUEwtMi4wIGxpY2Vuc2UgaWRlbnRpZmllciB0byBmaWxlcyB3aXRo
IG5vIGxpY2Vuc2UpCj4gPiBTaWduZWQtb2ZmLWJ5OiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVt
Lm1pdC5lZHU+Cj4gPiAtLS0KPiA+Cj4gPiBCZW4sIHlvdSBkaWQgbGlrZSA5OS43JSBvZiB0aGlz
IHdvcmssIHNvIHVsdGltYXRlbHkgeW91ciBjYWxsLiBQcmV0dHkKPiA+IG11Y2ggYWxsIG9mIHRo
ZXNlIHdlcmUgc3BsaXQgb3V0IGZyb20gb3RoZXIgTUlULWxpY2Vuc2VkIGZpbGVzLCBhbmQgbW9z
dAo+ID4gYXJlIGhlYWRlciBmaWxlcyBhbnl3YXlzLgo+ID4KPiBBbGwgb2YgbXkgZ2xvcmlvdXMg
MjMgcGF0Y2hlcyB0byBub3V2ZWF1IGFyZSBtZWFudCB0byBiZSB1bmRlciBNSVQuCj4gQWNrZWQt
Ynk6IEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgo+Cj4gPiBBbm90aGVy
IGNoYW5nZSBtaWdodCBiZSB0byBhZGQgdGhlIFNQRFggaWRlbnRpZmllciB0byBmaWxlcyAqd2l0
aCoKPiA+IHRoZSBNSVQgYm9pbGVycGxhdGUsIGJ1dCBJIGRpZG4ndCB3YW50IHRvIGRvIHRvbyBt
dWNoIGhlcmUuCj4gPgo+IE5vIG9iamVjdGlvbnMgb24gbXkgZW5kIDotKQo+Cj4gLUVtaWwKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTm91dmVh
dSBtYWlsaW5nIGxpc3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
