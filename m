Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA9710029E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 11:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE93689DEC;
	Mon, 18 Nov 2019 10:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747FC89DEC
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 10:37:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b3so18788897wrs.13
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 02:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g1CyX5yVtGYkmELZGCfUZykcSsSoxQRk2J5ND1QtJiE=;
 b=RjOiRL5SY/vpOjxJ3q6+SXkLPKvtQXI1J/JU0KbJM9DVKtwhMTFRkJrwTAmeKF6TxM
 I1YylYobDBgJaHVSaKiVruqkuXxxc2XKGaxTqiKw6HTyBFjPJDP8pcINfUVu/8WLGuBF
 vXmLKBYqx19Qacrke29Jdmbsnv39VKEOukUUN7umwu6KixdlKa1rcv6upuauuhWRut/o
 T1drYqMLuw/xVyhl1aNCz36NTW2No5bbwQzQXjItQrH190C4maqdhdQzLJ/KgTycf0YC
 8sx+TxTj0vp54jzP5CEXJ9g4cGPWQF8E7Tz1p7RcqMylapTD1E/AaMwvQqHmuYhihtQD
 9Dcg==
X-Gm-Message-State: APjAAAWn1g4LtB/bGlF+CRpv+UTSZbCkU0BRnZyxHFQab9mA3dH6KguY
 SZjYXpS6xGpYvnSwC3lsWHZQ2j+PW+0=
X-Google-Smtp-Source: APXvYqxXrGVZ0mCTiIlU4yHeU3UvgOB8pYg21JDMlga/2qOBFN4A3tRHUlnq9ZwU3sI966P3o9O2ag==
X-Received: by 2002:a5d:5089:: with SMTP id a9mr13332210wrt.57.1574073432162; 
 Mon, 18 Nov 2019 02:37:12 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id c144sm20235918wmd.1.2019.11.18.02.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 02:37:11 -0800 (PST)
Date: Mon, 18 Nov 2019 11:37:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] MAINTAINERS: Remove myself from drm-misc entry
Message-ID: <20191118103709.GE23790@phenom.ffwll.local>
References: <20191115205302.246625-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115205302.246625-1-sean@poorly.run>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=g1CyX5yVtGYkmELZGCfUZykcSsSoxQRk2J5ND1QtJiE=;
 b=XLipCcfKX2oF/HaZks6E7idU/gB66VKEP/9D1enF4Sxt3zg+pZhoH+cbiNm3F+WpiM
 oFiv4CCm40cXXsI/HUXJSIH/DWTVst8a+u7eWFve2lNKgYC61kp/YldLkfF27593xxae
 q69RaF1D/ilsYRFMXCYiPsBLzBn+Dc4BbsGJA=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDM6NTI6MzZQTSAtMDUwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFu
a2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJu
ZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+IC0t
LQo+IAo+IEkgbmVlZCB0byBzdGVwIGF3YXkgZnJvbSAtbWlzYyB0byBwcmlvcml0aXplIG90aGVy
IHdvcmsgdGhhdCBJIGhhdmUgb24KPiBteSBwbGF0ZS4gSXQncyBiZWVuIGdyZWF0IGZ1biAobW9z
dCBvZiB0aGUgdGltZSkgYW5kIHZlcnkgcmV3YXJkaW5nCj4gZG9pbmcgdGhpcyBqb2IuIEkgd2ls
bCByZWFsbHkgbWlzcyBpdCEKPiAKPiBJIHBsYW4gb24gdGhlIDUuNSByZWxlYXNlIGJlaW5nIG15
IGxhc3Qgb25lIGJlZm9yZSB0cmFuc2l0aW9uaW5nIHRvIG15Cj4gbmV3IHJvbGUgYXMgY29tbWl0
dGVyIDotKQoKVGhhbmtzIGEgbG90IGZvciB5b3VyIHNlcnZpY2UgYXMgbWFpbnRhaW5lciEKCkFj
a2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKQ2hlZXJzLCBE
YW5pZWwKCj4gCj4gU2Vhbgo+IAo+IAo+ICBNQUlOVEFJTkVSUyB8IDEgLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5U
QUlORVJTCj4gaW5kZXggYjYzYzI5MWFkMDI5Li5jMmI4OTQ1MzgwNWYgMTAwNjQ0Cj4gLS0tIGEv
TUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJTkVSUwo+IEBAIC01MzYyLDcgKzUzNjIsNiBAQCBG
OglpbmNsdWRlL2xpbnV4L3ZnYSoKPiAgRFJNIERSSVZFUlMgQU5EIE1JU0MgR1BVIFBBVENIRVMK
PiAgTToJTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KPiAgTToJTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+IC1NOglTZWFuIFBh
dWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiAgVzoJaHR0cHM6Ly8wMS5vcmcvbGludXhncmFwaGljcy9n
ZngtZG9jcy9tYWludGFpbmVyLXRvb2xzL2RybS1taXNjLmh0bWwKPiAgUzoJTWFpbnRhaW5lZAo+
ICBUOglnaXQgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjCj4gLS0g
Cj4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKPiAK
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
