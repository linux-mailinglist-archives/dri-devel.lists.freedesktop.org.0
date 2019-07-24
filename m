Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A979F73398
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 18:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E946E5EF;
	Wed, 24 Jul 2019 16:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75736E5EF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 16:22:37 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id q22so90821081iog.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 09:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0pFUYCuG7AoXvxAAMye043kB0Ck5a/z3KzBcHr/NvUI=;
 b=jS21fiYOCqCS3or24WXSc2TSYtLTVm3E4GiLXzfqsi8xYYwp72qpXF8bYqA0MCAfsY
 TiVBngjP4uTePM1Cc3Gp2H3Qlzm7nYPSv8BSD3+E+A6w6avY/PzkGwbbJJR20qW7/GUI
 RaGUIY1/UxNQM/Qcf5mw8JKlSs3s3lTHJdNBbYBexatJvth9HCJ2Rf54Z5voYZ1UW397
 6IoGZlBk96wy81FPPcPEeMZi5ZLy6Qr2iLHYTM8oiPT5+JcsDfakiHxFHgxkH+LPiTMw
 JffdwR+gU38UQCBeNd/Yc9LL9KREXuQIi5XHOKC3MFCGowk3bBn6Z3+d+XDkYao8R7IF
 Y4XA==
X-Gm-Message-State: APjAAAWz0PHOzFeP5RzTJk2QR7FmWBZvt3pbr01GQxh9aQr32k6o9TQc
 NL2ulLM4ivMO6tUk0bkfuQ==
X-Google-Smtp-Source: APXvYqxwttEmughqFzxmK+5nmTZGEmzj0HE0CnKpoXP05dWh040CIEpFh3TcsYaHOy3fY/ZRZ6rexA==
X-Received: by 2002:a02:1607:: with SMTP id a7mr83847006jaa.123.1563985356884; 
 Wed, 24 Jul 2019 09:22:36 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id y20sm35919391iol.34.2019.07.24.09.22.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 09:22:36 -0700 (PDT)
Date: Wed, 24 Jul 2019 10:22:35 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 16/60] dt-bindings: Add vendor prefix for LG Display
Message-ID: <20190724162235.GA7651@bogus>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-13-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190707181937.6250-13-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAgNyBKdWwgMjAxOSAyMToxODo1MyArMDMwMCwgTGF1cmVudCBQaW5jaGFydCB3cm90
ZToKPiBMRyBEaXNwbGF5IGlzIGFuIExDRCBkaXNwbGF5IG1hbnVmYWN0dXJlci4gT3JpZ2luYWxs
eSBmb3JtZWQgYXMgYSBqb2ludAo+IHZlbnR1cmUgYnkgTEcgRWxlY3Ryb25pY3MgYW5kIFBoaWxp
cHMgRWxlY3Ryb25pY3MsIGl0IHdhcyBmb3JtZXJseSBrbm93bgo+IGFzIExHLlBoaWxpcHMgTENE
LCBoZW5jZSB0aGUgRFQgdmVuZG9yIHByZWZpeCBsZ3BoaWxpcHMgKHdoaWNoIGlzCj4gYWxyZWFk
eSBpbiBhY3RpdmUgdXNlIGluIHRoZSBrZXJuZWwpLgo+IAo+IE1vcmUgaW5mb3JtYXRpb24gaXMg
YXZhaWxhYmxlIGF0Cj4gaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvTEdfRGlzcGxheS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy92ZW5kb3ItcHJlZml4ZXMueWFtbCB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQo+IAoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
