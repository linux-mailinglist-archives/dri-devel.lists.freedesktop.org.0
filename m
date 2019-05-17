Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC5D2121D
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 04:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F04289804;
	Fri, 17 May 2019 02:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4BE89804
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 02:39:09 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C3562087B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 02:39:09 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id a39so6438283qtk.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 19:39:09 -0700 (PDT)
X-Gm-Message-State: APjAAAVAB+arQ9MC+G9x635Gl0wwmmbRhy0bNxMtWagQhCGmeorT+lWe
 zpVxHq8M3+rrrZQOOojrKvDyhZOhuiakEM+uPQ==
X-Google-Smtp-Source: APXvYqxfkBcJJV+k4YhPLqOMGHNRB1pml6w7PKX746J/EqgFTzh8zJw36RSYd7wDFhnTGhrChd1CeHL5fojbJndqaOc=
X-Received: by 2002:ac8:3884:: with SMTP id f4mr46866537qtc.300.1558060748294; 
 Thu, 16 May 2019 19:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190416100645.21689-1-m.felsch@pengutronix.de>
 <20190416100645.21689-2-m.felsch@pengutronix.de> <20190423122612.GN23448@ulmo>
In-Reply-To: <20190423122612.GN23448@ulmo>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 16 May 2019 21:38:57 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK5jKza61=KOmHCU9SjSsZf-jkstwDZYBr4V-JOa0iSsw@mail.gmail.com>
Message-ID: <CAL_JsqK5jKza61=KOmHCU9SjSsZf-jkstwDZYBr4V-JOa0iSsw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: add vendor prefix for Evervision
 Electronics
To: Thierry Reding <thierry.reding@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558060749;
 bh=1I3YDHH3jLyXZDhwFrnS+qToUeRAmuFuLnAJqjRcAC0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wsA6uUs8+kLhM5WZiHA2epsnGV12oUfz3RNpgcFBw14BgQ4Qr4gk46LaDiA/8mZbq
 1k+XMB/hLUu8xR9BSeKZkp9i6y1r1ZJjWgaZfaZz39V55Ga/N8fRBgJp9z4v9SjKbr
 rNreiWB40vItVyZ/oD/WiQXh6VFOQ/FqHS3BUm+I=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sascha Hauer <kernel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgNzoyNiBBTSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXByIDE2LCAyMDE5IGF0IDEyOjA2
OjQzUE0gKzAyMDAsIE1hcmNvIEZlbHNjaCB3cm90ZToKPiA+IEV2ZXJ2aXNpb24gRWxlY3Ryb25p
Y3MgaXMgYSBwYW5lbCBtYW51ZmFjdHVyZXIgZnJvbSBUYWlwZWkuCj4gPiBodHRwOi8vd3d3LmV2
ZXJ2aXNpb25sY2QuY29tL2luZGV4LnBocD9sYW5nPWVuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
TWFyY28gRmVsc2NoIDxtLmZlbHNjaEBwZW5ndXRyb25peC5kZT4KPiA+IFJldmlld2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy50eHQgfCAxICsKPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IEFwcGxpZWQsIHRoYW5rcy4KCkkndmUgY29udmVy
dGVkIHRoaXMgZmlsZSB0byBqc29uLXNjaGVtYSBhcyBvZiB2NS4yLXJjMS4gU2VlIGNvbW1pdAo4
MTIyZGU1NDYwMmUuIEFwcGxpZWQsIGJ1dCBkb2Vzbid0IHNlZW0gdG8gYmUgaW4gbGludXgtbmV4
dD8KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
