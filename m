Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 107B57E1DCA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 11:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611A110E2AC;
	Mon,  6 Nov 2023 10:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E3110E2AC;
 Mon,  6 Nov 2023 10:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699264917; x=1730800917;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=6bHMkATEJ+mnbjtM+ryLL2gOSS19x5PGbIDvtB91e5E=;
 b=FZi/wVXswIXrM2FxIxCoKP+GQBU4jU7Aa7drdjrw+erA2ZzPFa2AJsUw
 g0JCeAUUx4R6s3EBZbgBd98gXJUlgwh4q91PHBZSe5gNhP3G3P0gIewE4
 ERVgrK/WTzkbGThohVpzOfYCdItpZjeTEcCOKqG+PkdOS2bQru/WE7NNK
 vuFSuLIWE0Ab6XXTJvsa32F2zpi+9gLC5JTlApju+rHdzgHqpwAuIgmhL
 4jZo25NGtaWpCtTEApsOjTHb94z54ijn8YzkS/bBm+6niausf8IJiBZIs
 9r0BMkQu5j78z4gfDpl4bYxzCZ9PzVBIsNLNKpL7/b8FksEZ36DYu7vrr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379634830"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
 d="scan'208,217";a="379634830"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 02:01:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="828166822"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
 d="scan'208,217";a="828166822"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 02:01:53 -0800
Content-Type: multipart/alternative;
 boundary="------------0g10498400YEkOTckBcQl0xI"
Message-ID: <1807db8f-2ba6-0838-1d4c-39ff4cb7a34d@linux.intel.com>
Date: Mon, 6 Nov 2023 11:01:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PULL] drm-misc-next
Content-Language: en-US
To: David Edelsohn <dje.gcc@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
References: <CAGWvnynOWoKT1EWkL8ELfRVxSUjm-hBQnnjb-w2Gq-tmOFm0Hg@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <CAGWvnynOWoKT1EWkL8ELfRVxSUjm-hBQnnjb-w2Gq-tmOFm0Hg@mail.gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------0g10498400YEkOTckBcQl0xI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, David.

On 11/3/23 17:37, David Edelsohn wrote:
> Dual-license drm_gpuvm to GPL-2.0 OR MIT.
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c 
> index 02ce6baacdad..08c088319652 100644 --- 
> a/drivers/gpu/drm/drm_gpuvm.c 
> <https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_gpuvm.c?id=6f2eeef4a0aa9791bbba9d353641a6e067bb86c1> 
> +++ b/drivers/gpu/drm/drm_gpuvm.c 
> <https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_gpuvm.c?id=f7749a549b4f4db0c02e6b3d3800ea400dd76c12>
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> /*
> * Copyright (c) 2022 Red Hat.
> *
> The above SPDX License Identifier change is incorrect and no longer
> valid. The change misunderstood the syntax of SPDX license identifiers
> and boolean operations. GPL-2.0-only is the name of the license and means
> GPL 2.0 only, as opposed to GPL 2.0 or later. The "only" does not
> refer to restrictions on other licenses in the identifier and should 
> not have been
> removed. The hyphens designated that the name was a single unit.
> The SPDX License Identifier boolean operators, such as OR, are a 
> separate layer
> of syntax.
> The SPDX License Identifier should be
> GPL-2.0-only OR MIT
> Thanks, David

The author has acked the change / relicensing, which is also described 
in the commit title so could you please elaborate why you think it is 
not valid?

Thanks,

Thomas



--------------0g10498400YEkOTckBcQl0xI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi, David.<br>
    </p>
    <div class=3D"moz-cite-prefix">On 11/3/23 17:37, David Edelsohn wrote=
:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAGWvnynOWoKT1EWkL8ELfRVxSUjm-hBQnnjb-w2Gq-tmOFm0Hg@mail.gmai=
l.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">
        <pre id=3D"gmail-b" style=3D"font-size:13px;background-image:init=
ial;background-position:initial;background-size:initial;background-repeat=
:initial;background-origin:initial;background-clip:initial;color:rgb(0,0,=
51)">Dual-license drm_gpuvm to GPL-2.0 OR MIT.</pre>
        <pre id=3D"gmail-b" style=3D"font-size:13px;background-image:init=
ial;background-position:initial;background-size:initial;background-repeat=
:initial;background-origin:initial;background-clip:initial;color:rgb(0,0,=
51)"><div class=3D"gmail-head" style=3D"font-weight:bold;margin-top:1em;c=
olor:black;font-size:13.3333px">diff --git a/drivers/gpu/drm/drm_gpuvm.c =
b/drivers/gpu/drm/drm_gpuvm.c
index 02ce6baacdad..08c088319652 100644
--- a/<a href=3D"https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/g=
pu/drm/drm_gpuvm.c?id=3D6f2eeef4a0aa9791bbba9d353641a6e067bb86c1" style=3D=
"color:blue;text-decoration-line:none" moz-do-not-send=3D"true">drivers/g=
pu/drm/drm_gpuvm.c</a>
+++ b/<a href=3D"https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/g=
pu/drm/drm_gpuvm.c?id=3Df7749a549b4f4db0c02e6b3d3800ea400dd76c12" style=3D=
"color:blue;text-decoration-line:none" moz-do-not-send=3D"true">drivers/g=
pu/drm/drm_gpuvm.c</a></div><div class=3D"gmail-hunk" style=3D"color:rgb(=
0,0,153);font-size:13.3333px">@@ -1,4 +1,4 @@</div><div class=3D"gmail-de=
l" style=3D"color:red;font-size:13.3333px">-// SPDX-License-Identifier: G=
PL-2.0-only</div><div class=3D"gmail-add" style=3D"color:green;font-size:=
13.3333px">+// SPDX-License-Identifier: GPL-2.0 OR MIT</div><div class=3D=
"gmail-ctx" style=3D"color:rgb(51,51,51);font-size:13.3333px"> /*</div><d=
iv class=3D"gmail-ctx" style=3D"color:rgb(51,51,51);font-size:13.3333px">=
  * Copyright (c) 2022 Red Hat.</div><div class=3D"gmail-ctx" style=3D"co=
lor:rgb(51,51,51);font-size:13.3333px">  *</div><div class=3D"gmail-ctx" =
style=3D"color:rgb(51,51,51);font-size:13.3333px">
</div><div class=3D"gmail-ctx" style=3D"color:rgb(51,51,51);font-size:13.=
3333px"><font face=3D"arial, sans-serif">The above SPDX License Identifie=
r change is incorrect and no longer</font></div><div class=3D"gmail-ctx" =
style=3D"color:rgb(51,51,51);font-size:13.3333px"><font face=3D"arial, sa=
ns-serif">valid.  The change misunderstood the syntax of SPDX license ide=
ntifiers</font></div><div class=3D"gmail-ctx" style=3D"color:rgb(51,51,51=
);font-size:13.3333px"><font face=3D"arial, sans-serif">and boolean opera=
tions.  GPL-2.0-only is the name of the license and means</font></div><di=
v class=3D"gmail-ctx" style=3D"color:rgb(51,51,51);font-size:13.3333px"><=
font face=3D"arial, sans-serif">GPL 2.0 only, as opposed to GPL 2.0 or la=
ter.  The "only" does not</font></div><div class=3D"gmail-ctx" style=3D"c=
olor:rgb(51,51,51);font-size:13.3333px"><font face=3D"arial, sans-serif">=
refer to restrictions on other licenses in the identifier and should not =
have been</font></div><div class=3D"gmail-ctx" style=3D"color:rgb(51,51,5=
1);font-size:13.3333px"><font face=3D"arial, sans-serif">removed.  The hy=
phens designated that the name was a single unit.</font></div><div class=3D=
"gmail-ctx" style=3D"color:rgb(51,51,51);font-size:13.3333px"><font face=3D=
"arial, sans-serif">The SPDX License Identifier boolean operators, such a=
s OR, are a separate layer</font></div><div class=3D"gmail-ctx" style=3D"=
color:rgb(51,51,51);font-size:13.3333px"><font face=3D"arial, sans-serif"=
>of syntax. </font></div><div class=3D"gmail-ctx" style=3D"color:rgb(51,5=
1,51);font-size:13.3333px"><font face=3D"arial, sans-serif">
</font></div><div class=3D"gmail-ctx" style=3D"color:rgb(51,51,51);font-s=
ize:13.3333px"><font face=3D"arial, sans-serif">The SPDX License Identifi=
er should be</font></div><div class=3D"gmail-ctx" style=3D"color:rgb(51,5=
1,51);font-size:13.3333px"><font face=3D"arial, sans-serif">
</font></div><div class=3D"gmail-ctx" style=3D"color:rgb(51,51,51);font-s=
ize:13.3333px"><font face=3D"arial, sans-serif">GPL-2.0-only OR MIT</font=
></div><div class=3D"gmail-ctx" style=3D"color:rgb(51,51,51);font-size:13=
=2E3333px"><font face=3D"arial, sans-serif">
</font></div><div class=3D"gmail-ctx" style=3D"color:rgb(51,51,51);font-s=
ize:13.3333px"><font face=3D"arial, sans-serif">Thanks, David</font></div=
></pre>
      </div>
    </blockquote>
    <p>The author has acked the change / relicensing, which is also
      described in the commit title so could you please elaborate why
      you think it is not valid?</p>
    <p>Thanks,</p>
    <p>Thomas</p>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------0g10498400YEkOTckBcQl0xI--
