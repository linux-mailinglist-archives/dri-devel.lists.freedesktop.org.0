Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 494F92399F
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 16:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900298925D;
	Mon, 20 May 2019 14:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2977E8925D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 14:15:12 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id n134so10418960lfn.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 07:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kx/yDCCQeU2zSUDnAgFXJPUZkTY1cxoc8n3EZ4sTOjE=;
 b=NjNLnNPI2WaOqnCWz8EciUQBvC/ZDnmpWMT/RraNmpGhD8epCux+w0tm3MvT7l6/gH
 6v5TextqP7qaCLtd1Dba3RtnOgtV2vvvXhMrZG7yTbkGzu63bZUjVAhmhqN2LZdM67uR
 e31ASb8Hhvm3bKl/UQT9H3btTH2zIy7fHbqBE7vV0dGDBHDTnTn9HtYB9/6DjQeTsaNm
 +ppFbK4fvZPU64nF69/lFQlQIzVb3TK+JkXfFYGSS/HpCVNxunkMSghwQTk+ZX/dByzQ
 m67sHLAwmHkhXAEzfSDoXwjlWVv5hpKQMsKzgadETy0K9V96zSYndVDgG/TGChcQTtt5
 07Uw==
X-Gm-Message-State: APjAAAUZrjmzqjTkVpVzcLEjtgHm+cehx4vM3jG/tLmo3TR4rLHDAj9/
 oORAasSriOA1TNj5cm47F1k13uc2DswSDJruj3M=
X-Google-Smtp-Source: APXvYqwj2ceWM4YhBGOmRZ5pwdB4eeUEm451Mh2+mQCIK/u8TVo9Vx194481PuU6lljVZ2NujjW+Y1mSVpW26MDyGzk=
X-Received: by 2002:ac2:5317:: with SMTP id c23mr12114501lfh.115.1558361710485; 
 Mon, 20 May 2019 07:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190219002706.20077-1-festevam@gmail.com>
 <20190423110336.GB23448@ulmo>
In-Reply-To: <20190423110336.GB23448@ulmo>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 20 May 2019 11:15:05 -0300
Message-ID: <CAOMZO5C4YKcUGJ9wDJHQE04278Cr6ujYnYwPs-yhCyKumbruqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: Add vendor prefix for VXT Ltd
To: Thierry Reding <thierry.reding@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Kx/yDCCQeU2zSUDnAgFXJPUZkTY1cxoc8n3EZ4sTOjE=;
 b=EoxUvv0mIQcNhvjP+Qu+GqfrXzw0d8cOaZVGQzsmsxub9Y7STNcWepuuTahEzm1miN
 fkU4XPKgsEVcL/9rSkavL8X6llQAcq/D4dJ6PONAMmSoU58y7Sy7zHHK20A1v2ipDW7V
 DckwV5XoFQPDbMCogGwK7kFUqw5ppEBvI6U7FN3wHEmJ2XVwdPRtqxZ3JydWajBvK58U
 dgbw+gmSDQQwD5KFCnN7atwuyM1Gqm9B5GKXuSGytz8PhevwyCu2s7zWgIjgetiIqccL
 gdFbwWP4QJ9owqQg0VwP4D4GyymfP989R2g31IRvXUYIik52vbOg4hOrVdD7lg9fb1l7
 JrDA==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 John Weber <john.weber@technexion.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgODowMyBBTSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgRmViIDE4LCAyMDE5IGF0IDA5OjI3
OjA0UE0gLTAzMDAsIEZhYmlvIEVzdGV2YW0gd3JvdGU6Cj4gPiBWWFQgTHRkIGlzIGEgbWFudWZh
Y3R1cmVyIG9mIHByb2plY3RlZCBjYXBhY2l0aXZlIHRvdWNoIHBhbmVsCj4gPiBhbmQgZGlzcGxh
eSBzb2x1dGlvbnM6IGh0dHA6Ly93d3cudnh0LmNvbS50dy8KPiA+Cj4gPiBSZXZpZXdlZC1ieTog
T3RhdmlvIFNhbHZhZG9yIDxvdGF2aW9Ab3NzeXN0ZW1zLmNvbS5icj4KPiA+IFJldmlld2VkLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFiaW8g
RXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIHNpbmNlIHYx
Ogo+ID4gLSBOb25lCj4gPgo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92
ZW5kb3ItcHJlZml4ZXMudHh0IHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4KPiBBcHBsaWVkIGFsbCB0aHJlZSBwYXRjaGVzLCB0aGFua3MuCgpJIGRvbid0IHNlZSBh
bnkgb2YgdGhlc2UgcGF0Y2hlcyBhcHBsaWVkIGluIGxpbnV4LW5leHQgbm9yIDUuMi1yYzEuCgpX
aGF0IGlzIHRoZSBpc3N1ZSBoZXJlPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
