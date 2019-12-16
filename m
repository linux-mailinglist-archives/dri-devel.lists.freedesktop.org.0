Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5E61228E5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B181D6E9B0;
	Tue, 17 Dec 2019 10:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F363A6E15D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 13:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1576503598; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I7vYLgIsS5tJQdkPlZ9agIsnannevGQoUa/+rxeDUjY=;
 b=er4Y+DsflE5wUPtNmfE+vP4acAeAWY2VasEC5ZAK0iwplyEheRxoF8oC8WW16PAZ3sBGK5
 g/L+Xb7D38tLwomnMp060HpmiumzH8/nW1obInbZ7Dj2TwgSzXPHzSm8opYwCwR1WXbYWr
 PqhDYdgDzDakj5IgDit7Slkbr29+23E=
Date: Mon, 16 Dec 2019 14:39:53 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/6] dt-bindings: display/ingenic: Add compatible
 string for JZ4770
To: Ville =?iso-8859-1?b?U3lyauRs5A==?= <ville.syrjala@linux.intel.com>
Message-Id: <1576503593.3.2@crapouillou.net>
In-Reply-To: <20191216131529.GN1208@intel.com>
References: <20191210144142.33143-1-paul@crapouillou.net>
 <20191214105418.GA5687@ravnborg.org> <20191216131529.GN1208@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,


Le lun., d=E9c. 16, 2019 at 15:15, Ville Syrj=E4l=E4 =

<ville.syrjala@linux.intel.com> a =E9crit :
> On Sat, Dec 14, 2019 at 11:54:18AM +0100, Sam Ravnborg wrote:
>>  Hi Paul.
>> =

>>  On Tue, Dec 10, 2019 at 03:41:37PM +0100, Paul Cercueil wrote:
>>  > Add a compatible string for the LCD controller found in the =

>> JZ4770 SoC.
>>  >
>>  > v2: No change
>>  >
>>  > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  > Acked-by: Rob Herring <robh@kernel.org>
>> =

>>  Whole series looks good.
>>  Acked-by: Sam Ravnborg <sam@ravnborg.org>
> =

> Paul, looks like you forgot to git commit --amend after adding the =

> tags.
> Now the commit messages have and extra "# *** extracted tags ***" in =

> them.

Sorry, I'm still relatively new to this :(

I thought they were going to be automatically removed since they are =

comments.

-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
