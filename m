Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1912C437B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 00:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12916E8A8;
	Tue,  1 Oct 2019 22:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6936E8A8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 22:09:15 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id n197so52096786iod.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 15:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:mime-version:content-transfer-encoding:cc:cc:to;
 bh=Ky4fHihXafpq+qOLFnfFO/66rwk/F0aBUPYVmRImj3A=;
 b=uSFu5nim+zVEQMstBuFKze7XOsFtBf4ITnxXCs65lkPJXIqgIL7TmOu+7u0p2b6K7E
 PmEi0sLTQM9kuTrEdR3Hg2UVp5hp6+H+r7wsosGXPBfaaEmRjH8e6j0smuu1UwW6YTcq
 hiZFYwi9p6c7ynpr8MlnhBp42MdhtQbf5xNSfohNpPEiRAQaGQCu95O25P6EVzCyrPWd
 KE0swyhajgc4JM7fshXpU9iyIzNvgJdyHY5A3lHWWfnUNk80A3ahfweK2fIa7XxqyQYc
 b8jD1FwPz1MYQpFDkchCxV9D1gZSGemegq/rnDrClS2NuojfmH7vO5d50C/mW/3hO+Ic
 SI6g==
X-Gm-Message-State: APjAAAUkpwFC11JpWGYU2bfGE6pmizbjrZ2exLXCWPxdt7WPZWj8dKSL
 ZC0C4JZA1jhBT64UQ+4LQOTbbMw=
X-Google-Smtp-Source: APXvYqxQzQlgiAQjfNgaIugbBD/oRHtDHXGc+JucILf/QEc0XPb7pw3JJmadr6TrkuKo5g/nMjRK6w==
X-Received: by 2002:a92:c691:: with SMTP id o17mr298733ilg.185.1569967754307; 
 Tue, 01 Oct 2019 15:09:14 -0700 (PDT)
Received: from localhost ([2607:fb90:1780:6fbf:9c38:e932:436b:4079])
 by smtp.gmail.com with ESMTPSA id l186sm8615029ioa.54.2019.10.01.15.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 15:09:13 -0700 (PDT)
Message-ID: <5d93ce89.1c69fb81.9b763.e2b7@mx.google.com>
Date: Tue, 01 Oct 2019 17:09:11 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: add vendor prefix for logic
 technologies limited
References: <20190920075411.15735-1-marcel@ziswiler.com>
In-Reply-To: <20190920075411.15735-1-marcel@ziswiler.com>
MIME-Version: 1.0
To: Marcel Ziswiler <marcel@ziswiler.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, ,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, j.bauer@endrich.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, info@logictechno.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMCBTZXAgMjAxOSAwOTo1NDoxMCArMDIwMCwgTWFyY2VsIFppc3dpbGVyIHdyb3Rl
Ogo+IEZyb206IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29tPgo+
IAo+IEFkZCB2ZW5kb3IgcHJlZml4IGZvciBMb2dpYyBUZWNobm9sb2dpZXMgTGltaXRlZCBbMV0g
d2hpY2ggaXMgYSBDaGluZXNlCj4gZGlzcGxheSBtYW51ZmFjdHVyZXIgZS5nLiBkaXN0cmlidXRl
ZCBieSBHZXJtYW4gRW5kcmljaCBCYXVlbGVtZW50ZQo+IFZlcnRyaWVicyBHbWJIIFsyXS4KPiAK
PiBbMV0gaHR0cHM6Ly9sb2dpY3RlY2huby5jb20vY29udGFjdC11cy8KPiBbMl0gaHR0cHM6Ly93
d3cuZW5kcmljaC5jb20vaXNpNTBfaXNpMzBfdGZ0LWRpc3BsYXlzL2x0MTcwNDEwLTF3aGNfaXNp
MzAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0
b3JhZGV4LmNvbT4KPiAKPiAtLS0KPiAKPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCj4gCgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
