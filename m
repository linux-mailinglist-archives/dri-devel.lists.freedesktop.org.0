Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4870649371B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 10:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D73310E99D;
	Wed, 19 Jan 2022 09:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B10F10E9A0;
 Wed, 19 Jan 2022 09:20:40 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id b13so8452059edn.0;
 Wed, 19 Jan 2022 01:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=jFVYA84iERSWI2eG2VbY/NEBmj7G8Zymi2vXwt/X7TE=;
 b=ZUT7Ji4Zmripr3brkosoB8UHJqM1SQCuZUg63GHC/GJtL0nUIs1WkOjV6uAEl5MrRZ
 YitshWOtPZB/dm8f3//S/hYyhgh5DIttuOKHEr16ksPYaQSe1O5YwcToTz75n/822u+K
 nc2NsZKrE+EFrdOYoUDx2gg69mo2tELXqzfktV3nKpQJ6uvJgpZnq6uimRvIbrHgatnQ
 Ryk9udsYw51p7Fpb48CK3E/MawUpvcCIIop09ihvlJhk0bvVv98QIyTTV4QRXc0SIl2Y
 f7RgztYk61QQhJ1uR2E32woSAlBkuRt+3GaX0f+Xt1Jm1kdEtsrr13KWgPoLYHQ47unR
 ZRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=jFVYA84iERSWI2eG2VbY/NEBmj7G8Zymi2vXwt/X7TE=;
 b=ZD0hatwDNV+dzHWSTeme9Q8tNj5r1ZDmwuAPzupcj2p3F8eNmBt9z6Wgbxk6WVRjeg
 LrT5Kk7BuOaF8xnXU+FEFfgeLK0vA6/eUZp1VJ+xMjO+mGx6i/0ccDQr9ZuTeJy+o+At
 9tsKPUP8gyY/+5l4npRXBkek/IFjsHdY1dZzlVMG5EVHpGX9p/73yTtacBYy42ugaKyn
 6Ys5SU6g7Zw5ecYP0oeX4cvxcuVRiiiNDe6a+xZL5ltwlxBF83IImQ1mOfmNKgT+c6Ws
 AWIzjg0PIK97OqTFSUclQoxiilcmOAc3ef/cSzXhnQPig24Ni4A6lhj9xuzoGoPe+Bag
 +pZg==
X-Gm-Message-State: AOAM531+2RWrfuDSIdKyvEXXy9SYomkvyDwSGeYE1aklHqfqSHUEQthM
 c1EIQBpam8OxciQpnHdkZEG47UZhNP1eOUAf97Q=
X-Google-Smtp-Source: ABdhPJwsoxqyH4FPYot3nhU44Ferdvu2ZNJNGMmTIZrzMRA3gUfXGcFXqMKOzjpJVUYAPO4NHNC3SHSENLknyWe/Lf4=
X-Received: by 2002:a17:907:6e0b:: with SMTP id
 sd11mr24475371ejc.132.1642584039027; 
 Wed, 19 Jan 2022 01:20:39 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:907:9713:0:0:0:0 with HTTP; Wed, 19 Jan 2022 01:20:38
 -0800 (PST)
In-Reply-To: <20220119072450.2890107-3-lucas.demarchi@intel.com>
References: <20220119072450.2890107-1-lucas.demarchi@intel.com>
 <20220119072450.2890107-3-lucas.demarchi@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Jan 2022 11:20:38 +0200
Message-ID: <CAHp75Vc4bdu1OTi2t-fHeHkmnVgd6LCdeotnGEH_+q4EGk3OmQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] lib/string_helpers: Add helpers for
 enable[d]/disable[d]
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: multipart/alternative; boundary="00000000000028f6a405d5ebe660"
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>, Mikita Lipski <mikita.lipski@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Raju Rangoju <rajur@chelsio.com>, Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Eryk Brol <eryk.brol@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000028f6a405d5ebe660
Content-Type: text/plain; charset="UTF-8"

On Wednesday, January 19, 2022, Lucas De Marchi <lucas.demarchi@intel.com>
wrote:

> Follow the yes/no logic and add helpers for enabled/disabled and
> enable/disable - those are not so common throughout the kernel,
> but they give a nice way to reuse the strings to log things as
> enabled/disabled or enable/disable.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_utils.h | 10 ----------
>  include/linux/string_helpers.h    |  2 ++
>  2 files changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_utils.h
> b/drivers/gpu/drm/i915/i915_utils.h
> index 2a8781cc648b..cbec79bae0d2 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -419,16 +419,6 @@ static inline const char *onoff(bool v)
>         return v ? "on" : "off";
>  }
>
> -static inline const char *enabledisable(bool v)
> -{
> -       return v ? "enable" : "disable";
> -}
> -
> -static inline const char *enableddisabled(bool v)
> -{
> -       return v ? "enabled" : "disabled";
> -}
> -
>  void add_taint_for_CI(struct drm_i915_private *i915, unsigned int taint);
>  static inline void __add_taint_for_CI(unsigned int taint)
>  {
> diff --git a/include/linux/string_helpers.h b/include/linux/string_
> helpers.h
> index e980dec05d31..e4b82f364ee1 100644
> --- a/include/linux/string_helpers.h
> +++ b/include/linux/string_helpers.h
> @@ -103,5 +103,7 @@ char *kstrdup_quotable_file(struct file *file, gfp_t
> gfp);
>  void kfree_strarray(char **array, size_t n);
>
>  static inline const char *yesno(bool v) { return v ? "yes" : "no"; }
> +static inline const char *enabledisable(bool v) { return v ? "enable" :
> "disable"; }
> +static inline const char *enableddisabled(bool v) { return v ? "enabled"
> : "disabled"; }


Looks not readable even if takes 80 characters. Please, keep original style.


I believe you wanted to have nice negative statistics from day 1, then you
may add more patches in the series to cleanup more users.




>
>  #endif
> --
> 2.34.1
>
>

-- 
With Best Regards,
Andy Shevchenko

--00000000000028f6a405d5ebe660
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, January 19, 2022, Lucas De Marchi &lt;<a href=3D"mail=
to:lucas.demarchi@intel.com">lucas.demarchi@intel.com</a>&gt; wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Follow the yes/no logic and add helpers for ena=
bled/disabled and<br>
enable/disable - those are not so common throughout the kernel,<br>
but they give a nice way to reuse the strings to log things as<br>
enabled/disabled or enable/disable.<br>
<br>
Signed-off-by: Lucas De Marchi &lt;<a href=3D"mailto:lucas.demarchi@intel.c=
om">lucas.demarchi@intel.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/i915/i915_<wbr>utils.h | 10 ----------<br>
=C2=A0include/linux/string_helpers.h=C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A02 files changed, 2 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/i915/i915_<wbr>utils.h b/drivers/gpu/drm/i915/=
i915_<wbr>utils.h<br>
index 2a8781cc648b..cbec79bae0d2 100644<br>
--- a/drivers/gpu/drm/i915/i915_<wbr>utils.h<br>
+++ b/drivers/gpu/drm/i915/i915_<wbr>utils.h<br>
@@ -419,16 +419,6 @@ static inline const char *onoff(bool v)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return v ? &quot;on&quot; : &quot;off&quot;;<br=
>
=C2=A0}<br>
<br>
-static inline const char *enabledisable(bool v)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return v ? &quot;enable&quot; : &quot;disable&q=
uot;;<br>
-}<br>
-<br>
-static inline const char *enableddisabled(bool v)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return v ? &quot;enabled&quot; : &quot;disabled=
&quot;;<br>
-}<br>
-<br>
=C2=A0void add_taint_for_CI(struct drm_i915_private *i915, unsigned int tai=
nt);<br>
=C2=A0static inline void __add_taint_for_CI(unsigned int taint)<br>
=C2=A0{<br>
diff --git a/include/linux/string_<wbr>helpers.h b/include/linux/string_<wb=
r>helpers.h<br>
index e980dec05d31..e4b82f364ee1 100644<br>
--- a/include/linux/string_<wbr>helpers.h<br>
+++ b/include/linux/string_<wbr>helpers.h<br>
@@ -103,5 +103,7 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gf=
p);<br>
=C2=A0void kfree_strarray(char **array, size_t n);<br>
<br>
=C2=A0static inline const char *yesno(bool v) { return v ? &quot;yes&quot; =
: &quot;no&quot;; }<br>
+static inline const char *enabledisable(bool v) { return v ? &quot;enable&=
quot; : &quot;disable&quot;; }<br>
+static inline const char *enableddisabled(bool v) { return v ? &quot;enabl=
ed&quot; : &quot;disabled&quot;; }</blockquote><div><br></div><div>Looks no=
t readable even if takes 80 characters. Please, keep original style.</div><=
div><br></div><div><br></div><div>I believe you wanted to have nice negativ=
e statistics from day 1, then you may add more patches in the series to cle=
anup more users.</div><div><br></div><div><br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
=C2=A0#endif<br>
-- <br>
2.34.1<br>
<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--00000000000028f6a405d5ebe660--
