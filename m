Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BE08E70C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CEE6E941;
	Thu, 15 Aug 2019 08:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9793789C9B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 16:31:17 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id u25so121241wmc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 09:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7j2F6czmvL1ihv3E7n7MMuOUAa5rNveJU7g593UBgYA=;
 b=PZq1xAN4jV8Pc+AHPNAFFW6AdSqXL7UHTpXkagS1JWCoJS8XblzQOwNHTMDm8Q5UM/
 Q8c8wZYHHUhMV2fAkPIEqjYP8L5cKlA5P3oFPQYJI6vNjGqOP2Y0ovSRGb9sVqy9wi3Z
 6oeCTvm21z/4b2j0T+ajLLhB23ufnahfiTAXbQ4P4J8OQcwuv0wBjm+8osGlmqudMVB6
 1dV/VSlV6bAbeUYTVRpOrhCUInw52HPLEP167irtY2zCC3s7SAXMZc8pT8AMyFbOxKRr
 5WMHdcD2tE5n/Ss0U2UojSvvXBg8uzLuzOQtxsy/jf/xtgEWyMITtIspuwQd9dn6AXEi
 d3cQ==
X-Gm-Message-State: APjAAAWJDab5c1JQZ9lnct2CZEFWgQIceHbvT41sv90QykyXjKhljl05
 +hx75s1bUR0l5zlLB/q0bHVG9kSRnwCPSn2tI8Or+Q==
X-Google-Smtp-Source: APXvYqyBPrcQ6sKCBQ9GudU9fmlJm1BzQW1oNBg6A7HHuE1qGnnV3Lr+F7PfdpqBa1bRHlFWSF9yk1iPYMGg2B6knOM=
X-Received: by 2002:a7b:c04f:: with SMTP id u15mr165779wmc.106.1565627476232; 
 Mon, 12 Aug 2019 09:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190808085522.21950-1-narmstrong@baylibre.com>
 <20190808085522.21950-4-narmstrong@baylibre.com>
In-Reply-To: <20190808085522.21950-4-narmstrong@baylibre.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Mon, 12 Aug 2019 18:31:05 +0200
Message-ID: <CAMO6naxDkpjLTaByYBhkgP6i1YE1F1ATBAp8gPuVjDy9DAUM7g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] MAINTAINERS: Update with Amlogic DRM bindings
 converted as YAML
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7j2F6czmvL1ihv3E7n7MMuOUAa5rNveJU7g593UBgYA=;
 b=xSTOh9h2HX4eRr/sFVEwfbnUvN24DujY5BIcNJrS8ivVAR6KMTWJ/ODWqQXBloN/jK
 z/XY2ixB+QMFtF0BLRbNSzSwRkyzcSXSXgWNBjcaF1mI9AaGtSexLw18VhF9X1SySAsY
 wynbSdt/jvTDFZkKTDx6B/u1LupR6bRzT5md+cGGgrkRNhvEbiHdHwhsbQ/ylF7TPebN
 gKiWtFddsM80lb1BkTKx++1N7O58a5UhkYM8AZjfqwnwm3Z/1SRF9fIkbeb5wrPkKy9W
 DkstxnclguamE68bROEp5JsalTxz2zlCJTDuRzy6UJF/bYrYmzf80dRMcooY8DeHBCPN
 bDGA==
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgOCwgMjAxOSBhdCAxMDo1NSBBTSBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gVGhlIGFtbG9naWMsbWVzb24tZHctaGRtaS50eHQg
YW5kIGFtbG9naWMsbWVzb24tdnB1LnR4dCBoYXMgYmVlbgo+IGNvbnZlcnRlZCB0byBZQU1MIHNj
aGVtYXMsIHVwZGF0ZSBNQUlOVEFJTkVSUyB0byBtYXRjaCB0aGVtIGFnYWluLgo+Cj4gU2lnbmVk
LW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IC0tLQo+
ICBNQUlOVEFJTkVSUyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5F
UlMKPiBpbmRleCA2NDI2ZGI1MTk4ZjAuLmM1NWMxODUzMWNkMSAxMDA2NDQKPiAtLS0gYS9NQUlO
VEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTUzMTgsOCArNTMxOCw4IEBAIEw6ICAg
ICAgICBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAgVzogICAgIGh0dHA6Ly9s
aW51eC1tZXNvbi5jb20vCj4gIFM6ICAgICBTdXBwb3J0ZWQKPiAgRjogICAgIGRyaXZlcnMvZ3B1
L2RybS9tZXNvbi8KPiAtRjogICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L2FtbG9naWMsbWVzb24tdnB1LnR4dAo+IC1GOiAgICAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYW1sb2dpYyxtZXNvbi1kdy1oZG1pLnR4dAo+ICtGOiAg
ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYW1sb2dpYyxtZXNv
bi12cHUueWFtbAo+ICtGOiAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYW1sb2dpYyxtZXNvbi1kdy1oZG1pLnlhbWwKPiAgRjogICAgIERvY3VtZW50YXRpb24v
Z3B1L21lc29uLnJzdAo+ICBUOiAgICAgZ2l0IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3Jn
L2RybS9kcm0tbWlzYwo+Cj4gLS0KPiAyLjIyLjAKPgoKUmV2aWV3ZWQtYnk6IE1heGltZSBKb3Vy
ZGFuIDxtam91cmRhbkBiYXlsaWJyZS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
