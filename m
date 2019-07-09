Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5276462DC2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 03:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4FF89D77;
	Tue,  9 Jul 2019 01:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213F189D77
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 01:58:28 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id j6so39753965ioa.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2019 18:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GkkAho5u9ZRo8sAo/m6sBY3/HBCvrNggwRmK+JAndDo=;
 b=AnH0soypwrOPHlLhRG5n6wKPlZ9bs5JqxurLMBZWcNeijn3RQ9URYLZGntMTR0sPWv
 DFOzHLHogDRD2NH51hQMdYlObI86iJjPHgG5tU3LWoYiY/4hbjRR6uSOD1VXCtDXiGwa
 3eUICE98a9u3Moavz0rTtubnWzb88ca9K5o6yYlwymBIt/i1aNA+L12GXJy7dzAvF6c+
 UnGmq3Zt5H8O2qE8r1UxL+Us0zcSDsrprEZKvW77FNo+BXjQJG2GcV0sTFWInpSnD2ca
 cCKlCoTEUKr7x0kzX36VKRapDwwnmWnEj1nrW9ymgE5CC8x0ARD5TUSSJRaNx7W6rSzB
 Zm/A==
X-Gm-Message-State: APjAAAXT+Y3deo8R5Y6pSuf57aJW+jcZP6zRDxW681MTzDWDA2qWpkol
 7p1lRmWzLwfcXunwrZSDDw==
X-Google-Smtp-Source: APXvYqzFMBYbPmXb2HfLpyr5pupdnhjP1NM+px7xYIHdBAoiAWfhkkQfdUbKjMiGk7ldZbL+nLrPZA==
X-Received: by 2002:a02:ab99:: with SMTP id t25mr24471171jan.113.1562637507345; 
 Mon, 08 Jul 2019 18:58:27 -0700 (PDT)
Received: from localhost ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id i23sm14676192ioj.24.2019.07.08.18.58.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 18:58:26 -0700 (PDT)
Date: Mon, 8 Jul 2019 19:58:25 -0600
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 5/5] dt-bindings: drm/panel: simple: add
 sharp,lq070y3dg3b panel
Message-ID: <20190709015825.GA4312@bogus>
References: <cover.1559905870.git.hns@goldelico.com>
 <ee90ed56d2c294ce8ac3b44bf2229c5ab9f85e91.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee90ed56d2c294ce8ac3b44bf2229c5ab9f85e91.1559905870.git.hns@goldelico.com>
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

T24gRnJpLCAgNyBKdW4gMjAxOSAxMzoxMToxMSArMDIwMCwgIkguIE5pa29sYXVzIFNjaGFsbGVy
IiB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRl
bGljby5jb20+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NoYXJwLGxxMDcw
eTNkZzNiLnR4dCAgICAgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NoYXJwLGxxMDcweTNkZzNiLnR4dAo+IAoKUmV2aWV3
ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
