Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045A2DF483
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 19:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66236E1B8;
	Mon, 21 Oct 2019 17:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD7F6E1B8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 17:48:37 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id i6so4300296ybe.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 10:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/aQ2Xv1WKwqQ6Cs7AfPTa0eGi7XzsweDvCsXYGNh4y0=;
 b=i5DJQyBMH62vweJWMtwNspuOa7eT+co6TGWgz2WqvGTL+l1NEuUSUDKKITziXXD1kK
 IhHnZ/Yxh58fOSioj79mcG+1tlndIRuLC0oS6lyKK0vdgXqHDrwFUxtZMQSpQUtYlXm2
 zow8vK0ugzQbFnng9OQBy66cyZimZcZ1BUVXbMg86FjiPouEqRNYQpEBujkvY8mJPZgI
 hgl+NKKr7wOveMt6tfO+CePmsEejfEA639u/k5C5zR5LRUTy+KQHlRkrUjA0v0Wf2wgT
 vSLN1QsaoqYUtCGsb5vOZCOw+HP67MPU0bbpOi+qO4ql+QTJOvGJWC1yq4yJfMGw7l8c
 qIKw==
X-Gm-Message-State: APjAAAUbYBInINE/vg5AWMNJy5F9hE/Rovwk1uTxofZmYV/S66b/j6mX
 WTe3BeY8lym/fvryLSZY8HnsbA==
X-Google-Smtp-Source: APXvYqzqDfFNGR9QqQ5nnvsB1IFVw6u/ZZPtSYlAbTyxlHYUl8FsAB4/vZgMdLMARfM5qbe7KIcSkw==
X-Received: by 2002:a25:2394:: with SMTP id
 j142mr16061531ybj.201.1571680116379; 
 Mon, 21 Oct 2019 10:48:36 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id n185sm3677429ywf.86.2019.10.21.10.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 10:48:35 -0700 (PDT)
Date: Mon, 21 Oct 2019 13:48:35 -0400
From: Sean Paul <sean@poorly.run>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] MAINTAINERS: Add Mihail to Komeda DRM driver
Message-ID: <20191021174835.GD85762@art_vandelay>
References: <20191021150123.19570-1-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021150123.19570-1-mihail.atanassov@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/aQ2Xv1WKwqQ6Cs7AfPTa0eGi7XzsweDvCsXYGNh4y0=;
 b=BYR1nPjjeKpiDFQPn+BoJTU76YiI0GfclJ9zGb/84dK/s6dMl3t0GKOk9y4Gem07Bx
 DYseBAQdislf/vUqD2wm9CsjwQWlfcIiaJQoruk86prLwOaPmPmoZ/sj2b/spt4Q4/OB
 bZk1kWKGA7w50ce0Kj54dYbBAIuSTzMNPE5pOKNj/Ugi7vmcvPfUXM0ZH1gU7w2vN4FF
 bjMqmpGI1tfwdbooJMHCuVtTwyu9rD41ntTGyfNvod8Dou/au2AAsaCoOK5VxzfUd7yG
 d2jDVydbKatZPEUMmygmZpOOO+bbirNPW7HbGN3E7fJz6tegpgA2PObik4Jp29PvMfE6
 dAHA==
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
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDM6MDE6NTZQTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBJJ2xsIGJlIHRoZSBtYWluIHBvaW50IG9mIGNvbnRhY3QuCj4gCj4gQ2M6IEph
bWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJt
LmNvbT4KPiBDYzogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPgoKQWNrZWQt
Ynk6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgoKPiAtLS0KPiAgTUFJTlRBSU5FUlMgfCAx
ICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL01B
SU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCA5NGZiMDc3YzA4MTcuLmQzMmYyNjNmMDAy
MiAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTEy
NTEsNiArMTI1MSw3IEBAIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2FybSxoZGxjZC50eHQKPiAgQVJNIEtPTUVEQSBEUk0tS01TIERSSVZFUgo+ICBNOglKYW1l
cyAoUWlhbikgV2FuZyA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gIE06CUxpdml1IER1ZGF1
IDxsaXZpdS5kdWRhdUBhcm0uY29tPgo+ICtNOglNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRh
bmFzc292QGFybS5jb20+Cj4gIEw6CU1hbGkgRFAgTWFpbnRhaW5lcnMgPG1hbGlkcEBmb3NzLmFy
bS5jb20+Cj4gIFM6CVN1cHBvcnRlZAo+ICBUOglnaXQgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3Rv
cC5vcmcvZHJtL2RybS1taXNjCj4gLS0gCj4gMi4yMy4wCj4gCgotLSAKU2VhbiBQYXVsLCBTb2Z0
d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
