Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A742D62DC1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 03:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6910989D4B;
	Tue,  9 Jul 2019 01:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA8289D4B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 01:58:04 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id j5so20373634ioj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 18:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GQzbbETa6UJgKSdt3O2pS1PP4bzJVAkM84nBoYUJVt4=;
 b=NpW9uIywO9ehrT6cez0i7bOJVAIk9vIEmAF9SnvkqBcjQAPeL45DFvEwdGus9yFtlp
 uI12FgIDfGHLC/2dN58NpH5wLgBdSHTvZUbS5sBbpa2IxsSyF+osOPv4C0X++XD085jq
 2Lw40ONLJvG6vTjfjzwTK2knAaxTwTAhYQQUnjG3rBR6M62JQjPEjs7ucOUlfOmdaPRA
 4VXKfXmEjn0KDpbPQdn66DlaHQiru9eix2p//0JxjPdDdm9j4dszZ2FAuAyFXzWIMmrR
 XgbPt0SVpImjBtbKHjmeV1CedxGT9uDRkr+Wf56Z/mA/EFhYKhOYADB99/1OBPvNLqeI
 x/nA==
X-Gm-Message-State: APjAAAWlyS2hIYHCVJSSZAp4p5NN4EwTuI2qkil0ghUvgBGoTos4/9Vo
 jQnUSK4P7pxAFcNzmhTWGw==
X-Google-Smtp-Source: APXvYqwRfm1mV0jx2un6sBO/Qnr82FWgfeB8yB5BMAvV9kilncXU03hkVZDSAK3hCr0ZBi8kzOpdrQ==
X-Received: by 2002:a5e:8209:: with SMTP id l9mr4080606iom.303.1562637484150; 
 Mon, 08 Jul 2019 18:58:04 -0700 (PDT)
Received: from localhost ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id a1sm14209071ioo.5.2019.07.08.18.58.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 18:58:03 -0700 (PDT)
Date: Mon, 8 Jul 2019 19:58:02 -0600
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: drm/panel: simple: add
 ortustech,com37h3m99dtc panel
Message-ID: <20190709015802.GA3451@bogus>
References: <cover.1559905870.git.hns@goldelico.com>
 <3e0720fbddfd7b35ad8551440544411485d8ad9f.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e0720fbddfd7b35ad8551440544411485d8ad9f.1559905870.git.hns@goldelico.com>
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
 letux-kernel@openphoenux.org, David Airlie <airlied@linux.ie>,
 marek.belisko@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
 Thierry Reding <thierry.reding@gmail.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAgNyBKdW4gMjAxOSAxMzoxMToxMCArMDIwMCwgIkguIE5pa29sYXVzIFNjaGFsbGVy
IiB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRl
bGljby5jb20+Cj4gLS0tCj4gIC4uLi9kaXNwbGF5L3BhbmVsL29ydHVzdGVjaCxjb20zN2gzbTk5
ZHRjLnR4dCAgICAgICAgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29ydHVzdGVjaCxjb20zN2gzbTk5ZHRjLnR4dAo+IAoK
UmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
