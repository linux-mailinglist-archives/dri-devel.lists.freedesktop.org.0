Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C578BE8CE3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 17:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FE96E461;
	Tue, 29 Oct 2019 16:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8C46E461
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 16:41:04 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 53so10335804otv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 09:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fvzDF1EQL0iAT5WRqqbNsT/xaQYYfBwjY6dwN6fN4vE=;
 b=AVnjqpSbmNQS2LrXsavTiT1X68KQn/9B+x7NqVU4DWf3D1lrru57D+7CM2Psnm1DPk
 NCCcL8yV1Z1GliXfuSQy94fm3QgKfN6oEowFvaram05X9JyzgtnfVZh2W6zfjJyf+46W
 GXMQeA/RWJa/rV25myu5Pk2kd0uUX/Nf+RfhvlMhxwdAjA76eDexL2s+4NIEIVTrfDn2
 9npRSJiW+Uj2ZN2dl7CF6DnSOYn4Qcam1lnb20Wnnd9UY4CCAHhNKUMdLlKSJcjW1+39
 o2ZGvFI86Z1Y6mTP6o/r7U2zPilCFhWml3K1jIndHbPZ/mIwB89G4cFPBRnNgff8JPS6
 Duzg==
X-Gm-Message-State: APjAAAUijTfW58sSA9TDSAOZ77Vi/TCkN1hdXqjorDZTxMST4z0BupuR
 FZpWmXSm/vRsFC1RPd1ayg==
X-Google-Smtp-Source: APXvYqxafeKH9kgtJXf3IqeJ45bIUjhlxFGWRtIy/IXgLiC7LvPuf9j+o4ls+HkmFicowKX00KL1Yg==
X-Received: by 2002:a05:6830:1d4c:: with SMTP id
 p12mr3473042oth.139.1572367263971; 
 Tue, 29 Oct 2019 09:41:03 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t12sm4826024otq.61.2019.10.29.09.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 09:41:03 -0700 (PDT)
Date: Tue, 29 Oct 2019 11:41:02 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: st,stm32-dsi: Fix white spaces
Message-ID: <20191029164102.GA21205@bogus>
References: <20191021151847.13891-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021151847.13891-1-krzk@kernel.org>
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
 Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMSBPY3QgMjAxOSAxNzoxODo0NyArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToKPiBSZW1vdmUgdW5uZWVkZWQgaW5kZW50YXRpb24gaW4gYmxhbmsgbGluZSBhbmQgc3Bh
Y2UgYXQgZW5kIG9mIGxpbmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6a0BrZXJuZWwub3JnPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1kc2kueWFtbCAgfCAyICstCj4gIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMueWFtbCB8IDIgKy0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCgpBcHBs
aWVkLCB0aGFua3MuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
