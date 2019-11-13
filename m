Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B940FA725
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 04:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA1B6E02A;
	Wed, 13 Nov 2019 03:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC556E02A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 03:21:21 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id l14so364394oti.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 19:21:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=QpBUJUS8nB4IDY7y0R8hl+FBwjsKsbh1meROaFZGKCA=;
 b=Tzhz1kfeIJ4XBNya4AD1ja9i0x+2Z45tF3Rft6BXuAOoQUA83HVioxFmpvx8MEkLeD
 oSEu+SL5z2PjUWSWgNCfsqmF/QFwTe3wgGoJillLFfWbhu4srR1iso8T6XIfHtjqysBa
 IQkKApAY1vAdBgQ3KtAyS4IjgVw7X+PYdikqNNuoALec9wTCTlSw6bGEMpzy9tK4nlK8
 NjvxmhdOxQCnW37PLQ1a9JiDdexj3CXcK2jmRGmxAWU4p1izk8rSmg88+AngYtZO8XLG
 rQwPb9Lbj6riLbKUWkItdJ8ycBygJPub9vjb8U3HNSmQKwGxoincCkZ4cKeGGOfbB5k1
 1zEQ==
X-Gm-Message-State: APjAAAV1AwdtEFiq/edpR5wVM9LTtAMBMB4DqR+gEiSRmHJXZH8oOdVa
 DWZtFqm2F5V0GicAXallz+pGFbk=
X-Google-Smtp-Source: APXvYqyIhAzYFJf8OJsXhu0w7bmN1x1bCUxobjWzSrdsBkKU/1LNHR6qZiA9P7CKjaVhd6fX8bGcXA==
X-Received: by 2002:a05:6830:4a1:: with SMTP id
 l1mr715933otd.291.1573615280360; 
 Tue, 12 Nov 2019 19:21:20 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f83sm257863oia.43.2019.11.12.19.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 19:21:19 -0800 (PST)
Date: Tue, 12 Nov 2019 21:21:18 -0600
From: Rob Herring <robh@kernel.org>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 2/7] dt-bindings: gpu: mali-midgard: Add Realtek RTD1295
Message-ID: <20191113032118.GA22026@bogus>
References: <20191104013932.22505-1-afaerber@suse.de>
 <20191104013932.22505-3-afaerber@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191104013932.22505-3-afaerber@suse.de>
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
 linux-realtek-soc@lists.infradead.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAgNCBOb3YgMjAxOSAwMjozOToyNyArMDEwMCwgPT9VVEYtOD9xP0FuZHJlYXM9MjBG
PUMzPUE0cmJlcj89IHdyb3RlOgo+IERlZmluZSBhIGNvbXBhdGlibGUgc3RyaW5nIGZvciBSZWFs
dGVrIFJURDEyOTUgU29DIGZhbWlseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIEbDpHJi
ZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9ncHUvYXJtLG1hbGktbWlkZ2FyZC55YW1sIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+IAoKQXBwbGllZCwgdGhhbmtzLgoKUm9iCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
