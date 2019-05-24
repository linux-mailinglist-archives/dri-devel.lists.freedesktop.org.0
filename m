Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F462A0C6
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 23:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDC66E10A;
	Fri, 24 May 2019 21:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A0C6E10A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 21:56:56 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id l25so10001031otp.8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 14:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ho8YvTqp0rATg7l+txR/qg/9Dte5oTGHToN5b94uwag=;
 b=Jr4V05re9gRtB4CLsFdc6FvcRuX7d7UnTzyDg+UcvXLlIeQ5l9hb12crNATo5Rb8d8
 U+eF6L83WUhC74covB/qjivCg7RSzcHg2zerFnTXlyW7q4JjXm1KCIuLBI3Hto3CP9Dc
 PoMx8yJULgUo+DylM7exvarNvX6fF55N1ThyxxEL+EvwCRJpQ8JBTPtmrG9GO38bKjE4
 p4uaMBWt3K2BJT78HrjiLWgHqSe4lki0SeRQikvzp1G2q6B2d4KS9PgGJYSs4v3d0gDj
 LYn06zk7+PomSR7f4K3lMifvvI7K9RpHICr4LYUCmRHwEToCDBhWcnf6V6+vad4CGl1O
 EQoQ==
X-Gm-Message-State: APjAAAU1ZQXD2SzapWcQ6U5J3VBLINtQIruEzDYzlOEW1sKrSU1RJ8Fi
 jbp1EWNJZW06cKkwH6e5yA==
X-Google-Smtp-Source: APXvYqwNL/0FgdI+TnsnkddnX1osuGlQibiQd+IDZ28cDtbOtb/DaqZmuifSiFaX3pdWvLKsmpm92Q==
X-Received: by 2002:a9d:6b99:: with SMTP id b25mr41053536otq.242.1558735015676; 
 Fri, 24 May 2019 14:56:55 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 37sm1345038oti.45.2019.05.24.14.56.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 14:56:55 -0700 (PDT)
Date: Fri, 24 May 2019 16:56:54 -0500
From: Rob Herring <robh@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: display/panel: Add KOE tx14d24vm1bpa
 display description
Message-ID: <20190524215654.GA16085@bogus>
References: <20180412143715.6828-1-lukma@denx.de>
 <20190515160428.6114-1-lukma@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515160428.6114-1-lukma@denx.de>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lukasz Majewski <lukma@denx.de>,
 Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxNSBNYXkgMjAxOSAxODowNDoyOCArMDIwMCwgTHVrYXN6IE1hamV3c2tpIHdyb3Rl
Ogo+IFRoaXMgY29tbWl0IGFkZHMgZG9jdW1lbnRhdGlvbiBlbnRyeSBkZXNjcmlwdGlvbiBmb3Ig
S09FJ3MgNS43IiBkaXNwbGF5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEx1a2FzeiBNYWpld3NraSA8
bHVrbWFAZGVueC5kZT4KPiAKPiAtLS0KPiBQcmV2aW91cyBkaXNjdXNzaW9uIChhbmQgUm9iJ3Mg
UmV2aWV3ZWQtYnkpIGFib3V0IHRoaXMgcGF0Y2gKPiBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3BhdGNoLzEwMzM5NTk1Lwo+IAo+IENoYW5nZXMgZm9yIHY0Ogo+IC0gUmViYXNlIG9uIHRv
cCBvZiBuZXdlc3QgbWFpbmxpbmUKPiBTSEExOiA1YWM5NDMzMjI0OGVlMDE3OTY0YmEzNjhjZGRh
NGNlNjQ3ZTNhYmE3Cj4gCj4gQ2hhbmdlcyBmb3IgdjMgOgo+IC0gTmV3IHBhdGNoCj4gLS0tCj4g
IC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2tvZSx0eDE0ZDI0dm0xYnBhLnR4dCAgIHwgNDIg
KysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygr
KQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcGFuZWwva29lLHR4MTRkMjR2bTFicGEudHh0Cj4gCgpSZXZpZXdlZC1ieTogUm9i
IEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
