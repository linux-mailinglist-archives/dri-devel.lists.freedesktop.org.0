Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E8A3C602
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 10:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27739891BE;
	Tue, 11 Jun 2019 08:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A287891AC
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 08:35:10 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k8so4146721eds.7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 01:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=TzDed0TQJg1TrUTqXFz4gFbkb3HIFlYJIYHPgH1TAN0=;
 b=c1S6lPyeoFxKTf8wMrXwXrqi7fFZJ4k38vUZOa/pD9YvvuMh8qyEXWqJJcMS44js+u
 AxZZgFkfLX0Ug5h4Lf/1xCVL4zepoBV/bwmrMCk59/mimJlD13NivfzcU1hnA+ulks02
 4zGRymd3SSzfIjUj8aKvsJlmrWIbyyrIo3NcctUW+9BIbhQl9mrYxH0AQ4+20NmLo6K0
 5ND9Zv51mq+ICnfOf5T+91mPCbLZ6+9Vold8sD2D8yIayenT4GRkgSe9aOe41a8333BB
 k+KyNW8yfqKreRsTcsu5NCYQmV2a3nMv9tXaln8uyTT3s66ehiAP4cDKWBw9fkGzvrbE
 G7uA==
X-Gm-Message-State: APjAAAVdxCyLng8c+W0al/9iE9pVQBoobnqLUq9IcqAE/QRTOusMMoOt
 4T7U8+0p9WE51dMKz2pXbfV7wmv+FNU=
X-Google-Smtp-Source: APXvYqyeJj6lOkP+dwksPbzO2lb4Yyucbsii/T+oZq4h1bcb9avDmrGSWIhEhtJhGDZrbz5+YrIGCQ==
X-Received: by 2002:a17:906:5806:: with SMTP id
 m6mr6861002ejq.219.1560242108736; 
 Tue, 11 Jun 2019 01:35:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id g37sm2909408edb.50.2019.06.11.01.35.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 01:35:07 -0700 (PDT)
Date: Tue, 11 Jun 2019 10:35:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/2] drm: panels: Add MAINTAINERS entry for LVDS panel
 driver
Message-ID: <20190611083505.GR21222@phenom.ffwll.local>
References: <20190608141242.17461-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190608141242.17461-1-laurent.pinchart+renesas@ideasonboard.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TzDed0TQJg1TrUTqXFz4gFbkb3HIFlYJIYHPgH1TAN0=;
 b=b4p2eEzkP9xoqMxKO+DIHblA//EqoHEycgIVXqeT12ihB5DxdEq4IC4XO27th34gUB
 Oa+3Slvpx9BtR2C1XZqxXadiGs9EgrWa6mDL52as2+Fu7z4xHXUQ6yBPslrRhajIARo0
 Fktn85nn10FSGjtSZ9cimKu4bOz2cEUwYN01k=
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMDgsIDIwMTkgYXQgMDU6MTI6NDFQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBBcyB0aGUgRFJNIExWRFMgcGFuZWwgZHJpdmVyIHVzZXMgYSBkaWZmZXJlbnQg
YXBwcm9hY2ggdG8gRFQgYmluZGluZ3MKPiBjb21wYXJlZCB0byB3aGF0IFRoaWVycnkgUmVkaW5n
IGFkdm9jYXRlcywgYWRkIGEgc3BlY2lmaWMgTUFJTlRBSU5FUlMKPiBlbnRyeSB0byBhdm9pZCBi
b3RoZXJpbmcgVGhpZXJyeSB3aXRoIHJlcXVlc3RzIHJlbGF0ZWQgdG8gdGhhdCBkcml2ZXIuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5l
c2FzQGlkZWFzb25ib2FyZC5jb20+Cj4gLS0tCj4gIE1BSU5UQUlORVJTIHwgOCArKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL01BSU5U
QUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCA3YTJmNDg3ZWE0OWEuLjcxMzczM2FmZWMxNyAx
MDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTUwMjEs
NiArNTAyMSwxNCBAQCBTOglPcnBoYW4gLyBPYnNvbGV0ZQo+ICBGOglkcml2ZXJzL2dwdS9kcm0v
aTgxMC8KPiAgRjoJaW5jbHVkZS91YXBpL2RybS9pODEwX2RybS5oCj4gIAo+ICtEUk0gRFJJVkVS
IEZPUiBMVkRTIFBBTkVMUwo+ICtNOglMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+Cj4gK0w6CWRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiArVDoJZ2l0IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0KClBhbmVscyBh
cmUgbWFpbnRhaW5lZCBpbiBkcm0tbWlzYy4gUHJldHR5IG11Y2ggbm90aGluZyB3cnQgZHJpdmVy
cyBpcwpkaXJlY3RseSBtYWludGFpbmVkIGluIGRybS5naXQgaXRzZWxmLgoKQWxzbywgeW91J2Qg
YWN0dWFsbHkgaGF2ZSBjb21taXQgcmlnaHRzIGZvciBkcm0tbWlzYywgYXMgb3Bwb3NlZCB0bwpk
cm0uZ2l0IDotUAoKV2l0aCB0aGF0IGZpeGVkOiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCj4gK1M6CU1haW50YWluZWQKPiArRjoJZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLWx2ZHMuYwo+ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1sdmRzLnR4dAo+ICsKPiAgRFJNIERSSVZFUiBG
T1IgTUFUUk9YIEcyMDAvRzQwMCBHUkFQSElDUyBDQVJEUwo+ICBTOglPcnBoYW4gLyBPYnNvbGV0
ZQo+ICBGOglkcml2ZXJzL2dwdS9kcm0vbWdhLwo+IC0tIAo+IFJlZ2FyZHMsCj4gCj4gTGF1cmVu
dCBQaW5jaGFydAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
