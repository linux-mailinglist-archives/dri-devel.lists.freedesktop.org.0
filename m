Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88536C0BCB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 20:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7406E20B;
	Fri, 27 Sep 2019 18:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0356E20B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 18:51:55 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id f21so3100695otl.13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 11:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=d41cCTl7w3rkM7T7TH1Wjkv6CwKEi+5QRtnS63WD5ZM=;
 b=OzePbf7N8Alw14mdj/NEPFh4TxgSPyhmm874v9FGqout6F42PoC7MHFlSxDI1cD3Lu
 ZoFsVLMIq2KY+Dhw9MzJKktr3W1ZEmrM5L6zDnwV+cpMmuXbrTAv5cs3FEe7I5z4137v
 TSy1P80jtQ/oEVKMf1Kr9Mg7FFO6D7awvIyrX/8gwPX4HEEuK6QQ0R15wu+tXdNNkqDa
 tSr0JJIUdI/BZmBoiLuEtqG3Mg4gCiocNGzl/Ikmi5MhCNQGHCP3i7Wgpq43yQhvIIK9
 eE0+wMcA/u0CnKiJS9JtiHAH9o2tLmynDhZm0dDuwQew3vO7nnLUZbRQuLRfB4ADUMvJ
 AiDQ==
X-Gm-Message-State: APjAAAW3vmp9QGJrsfiseN7JWn97McoYuHgH7JSqRMnH7k/WQfHIT6nz
 hQVHmvx8MVUbvxbBQO+Izg==
X-Google-Smtp-Source: APXvYqy7kAP35+kBMD+IB6YfX5awR9sKBq4fbOg1XNya+RBpUkbPY3uEzjMNx9j7YtN3dMZyiE8Z7Q==
X-Received: by 2002:a05:6830:443:: with SMTP id
 d3mr4430310otc.93.1569610314662; 
 Fri, 27 Sep 2019 11:51:54 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v75sm1961767oia.6.2019.09.27.11.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 11:51:53 -0700 (PDT)
Date: Fri, 27 Sep 2019 13:51:53 -0500
From: Rob Herring <robh@kernel.org>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH V3 2/3] dt-bindings: Add Logic PD Type 28 display panel
Message-ID: <20190927185153.GA982@bogus>
References: <20190925184239.22330-1-aford173@gmail.com>
 <20190925184239.22330-2-aford173@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925184239.22330-2-aford173@gmail.com>
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
 David Airlie <airlied@linux.ie>, adam.ford@logicpd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDE6NDI6MzdQTSAtMDUwMCwgQWRhbSBGb3JkIHdyb3Rl
Ogo+IFRoaXMgcGF0Y2ggYWRkcyBkb2N1bWVudGF0aW9uIG9mIGRldmljZSB0cmVlIGJpbmRpbmdz
IGZvciB0aGUgV1ZHQSBwYW5lbAo+IExvZ2ljIFBEIFR5cGUgMjggZGlzcGxheS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4KPiAtLS0KPiBWMzogIENv
cnJlY3QgYnVpbGQgZXJyb3JzIGZyb20gJ21ha2UgZHRfYmluZGluZ19jaGVjaycKPiBWMjogIFVz
ZSBZQU1MIGluc3RlYWQgb2YgVFhUIGZvciBiaW5kaW5nCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2xvZ2ljcGQsdHlwZTI4
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9s
b2dpY3BkLHR5cGUyOC55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwMDAuLjc0YmE2NTBlYTdhMAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9sb2dpY3BkLHR5cGUyOC55YW1sCj4g
QEAgLTAsMCArMSwzMSBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsg
T1IgWDExKQoKKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpIHBsZWFzZS4KClgxMSBpcyBw
cmV0dHkgbXVjaCBuZXZlciByaWdodCB1bmxlc3MgdGhpcyBpcyBjb3B5cmlnaHQgWCBDb25zb3J0
aXVtLgoKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL2Rpc3BsYXkvcGFuZWwvbG9naWNwZCx0eXBlMjgueWFtbCMKPiArJHNjaGVtYTogaHR0
cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTog
TG9naWMgUEQgVHlwZSAyOCA0LjMiIFdRVkdBIFRGVCBMQ0QgcGFuZWwKPiArCj4gK21haW50YWlu
ZXJzOgo+ICsgIC0gQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+Cj4gKwoKWW91IG5lZWQ6
CgphbGxPZjoKICAtICRyZWY6IHBhbmVsLWNvbW1vbi55YW1sIwoKPiArcHJvcGVydGllczoKPiAr
ICBjb21wYXRpYmxlOgo+ICsgICAgY29uc3Q6IGxvZ2ljcGQsdHlwZTI4Cj4gKwoKPiArICBwb3dl
ci1zdXBwbHk6Cj4gKyAgICBkZXNjcmlwdGlvbjogUmVndWxhdG9yIHRvIHByb3ZpZGUgdGhlIHN1
cHBseSB2b2x0YWdlCj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBlbmFibGUtZ3Bpb3M6Cj4g
KyAgICBkZXNjcmlwdGlvbjogR1BJTyBwaW4gdG8gZW5hYmxlIG9yIGRpc2FibGUgdGhlIHBhbmVs
Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBiYWNrbGlnaHQ6Cj4gKyAgICBkZXNjcmlwdGlv
bjogQmFja2xpZ2h0IHVzZWQgYnkgdGhlIHBhbmVsCj4gKyAgICAkcmVmOiAiL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZSIKClRoZXNlIDMgYXJlIGFsbCBkZWZpbmVkIGlu
IHRoZSBjb21tb24gc2NoZW1hLCBzbyB5b3UganVzdCBuZWVkICd0cnVlJyAKZm9yIHRoZSB2YWx1
ZSB0byBpbmRpY2F0ZSB0aGV5IGFwcGx5IHRvIHRoaXMgcGFuZWwgYW5kIHRvIG1ha2UgCidhZGRp
dGlvbmFsUHJvcGVydGllczogZmFsc2UnIGhhcHB5LgoKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0g
Y29tcGF0aWJsZQoKQXJlIHRoZSByZXN0IHJlYWxseSBvcHRpb25hbD8gCgo+ICsKPiArYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlCj4gLS0gCj4gMi4xNy4xCj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
